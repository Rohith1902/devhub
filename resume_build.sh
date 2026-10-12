#!/bin/bash

BASE="$HOME/ResumeProfiles"
mkdir -p "$BASE"

FIELDS=(
    name
    target_role
    location
    email
    phone
    github
    linkedin
    portfolio
    summary
    education
    skills
    projects
    experience
    certifications
    languages
    activities
)

valid_name() {
    [[ "$1" =~ ^[a-zA-Z0-9_-]+$ ]]
}

is_na() {
    local value
    value=$(printf '%s' "$1" | tr -d '[:space:]')

    [[ -z "$value" ]] ||
    [[ "$value" =~ ^([Nn]/?[Aa]|[Nn][Oo][Nn][Ee]|[Nn][Uu][Ll][Ll])$ ]]
}

read_field() {
    local dir="$1"
    local field="$2"
    local value=""

    if [[ -f "$dir/$field.txt" ]]; then
        value=$(<"$dir/$field.txt")
    fi

    printf '%s' "$value"
}

ask_field() {
    local dir="$1"
    local field="$2"
    local label="$3"
    local value=""

    if [[ -f "$dir/$field.txt" ]]; then
        value=$(<"$dir/$field.txt")
    fi

    echo
    printf '%s' "$label"
    printf ' (enter NA to skip): '

    read -r value

    printf '%s\n' "$value" > "$dir/$field.txt"
}

create_resume() {
    local name
    local dir

    read -r -p "Enter profile name: " name

    if ! valid_name "$name"; then
        echo "Use only letters, numbers, underscores, and hyphens."
        return
    fi

    dir="$BASE/$name"

    if [[ -d "$dir" ]]; then
        echo "Profile already exists."
        return
    fi

    mkdir -p "$dir"

    for field in "${FIELDS[@]}"; do
        ask_field "$dir" "$field" "Enter ${field//_/ }"
    done

    echo
    echo "Resume profile created successfully."
}

edit_resume() {
    local name
    local dir

    read -r -p "Enter profile name to modify: " name

    if ! valid_name "$name"; then
        echo "Invalid profile name."
        return
    fi

    dir="$BASE/$name"

    if [[ ! -d "$dir" ]]; then
        echo "Profile not found."
        return
    fi

    for field in "${FIELDS[@]}"; do
        ask_field "$dir" "$field" "Update ${field//_/ }"
    done

    echo
    echo "Resume profile updated successfully."
}

list_resumes() {
    echo
    echo "Available Resume Profiles"
    echo "-------------------------"

    local found=0
    local dir

    for dir in "$BASE"/*/; do
        [[ -d "$dir" ]] || continue

        printf '%s\n' "$(basename "$dir")"
        found=1
    done

    if [[ "$found" -eq 0 ]]; then
        echo "No profiles found."
    fi
}

generate_resume() {
    local name
    local dir
    local md
    local css
    local html
    local pdf
    local value
    local label
    local field
    local contact_html=""

    read -r -p "Enter profile name: " name

    if ! valid_name "$name"; then
        echo "Invalid profile name."
        return
    fi

    dir="$BASE/$name"

    if [[ ! -d "$dir" ]]; then
        echo "Profile not found."
        return
    fi

    for tool in pandoc chromium; do
        if ! command -v "$tool" >/dev/null 2>&1; then
            echo "Required tool not found: $tool"
            echo "Please check your installation."
            return
        fi
    done

    md="$dir/resume.md"
    css="$dir/resume.css"
    html="$dir/resume.html"
    pdf="$dir/resume.pdf"

    # Start the resume document.

    : > "$md"

    value=$(read_field "$dir" "name")

    if is_na "$value"; then
        echo "A valid name is required."
        return
    fi

    {
        printf '# %s\n\n' "$value"
    } >> "$md"

    # Add the target role.

    value=$(read_field "$dir" "target_role")

    if ! is_na "$value"; then
        printf '%s\n\n' "$value" >> "$md"
    fi

    # Add contact details without decorative symbols.

    for field in location email phone github linkedin portfolio; do
        value=$(read_field "$dir" "$field")

        if ! is_na "$value"; then
            case "$field" in
                location)  label="Location" ;;
                email)     label="Email" ;;
                phone)     label="Phone" ;;
                github)    label="GitHub" ;;
                linkedin)  label="LinkedIn" ;;
                portfolio) label="Portfolio" ;;
            esac

            # Escape HTML characters in contact details.
            value=${value//&/\&amp;}
            value=${value//</\&lt;}
            value=${value//>/\&gt;}
            value=${value//\"/\&quot;}

            contact_html+="<span><strong>${label}:</strong> ${value}</span>"
        fi
    done

    if [[ -n "$contact_html" ]]; then
        printf '%s\n\n' \
            "<p class=\"contact\">$contact_html</p>" >> "$md"
    fi

    # Add resume sections only when their contents are valid.

    declare -A SECTION_NAMES=(
        [summary]="Professional Summary"
        [education]="Education"
        [skills]="Skills"
        [projects]="Projects"
        [experience]="Experience"
        [certifications]="Certifications"
        [languages]="Languages"
        [activities]="Activities"
    )

    for field in summary education skills projects experience \
                 certifications languages activities; do

        value=$(read_field "$dir" "$field")

        if is_na "$value"; then
            continue
        fi

        # Ignore a field containing only NA or N/A.
        {
            printf '## %s\n\n' "${SECTION_NAMES[$field]}"
            printf '%s\n\n' "$value"
        } >> "$md"
    done

    # Resume styling.

    cat > "$css" <<'CSS'
@page {
    size: A4;
    margin: 14mm 16mm;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 10pt;
    line-height: 1.4;
    color: #222222;
    max-width: 100%;
}

h1 {
    font-size: 23pt;
    text-align: center;
    margin-bottom: 4pt;
    color: #17365D;
}

h2 {
    font-size: 12pt;
    color: #17365D;
    border-bottom: 1px solid #B8C7D9;
    padding-bottom: 3pt;
    margin-top: 13pt;
    margin-bottom: 5pt;
    page-break-after: avoid;
}

h1 + p {
    text-align: center;
    font-size: 10pt;
    margin-top: 0;
}

.contact {
    text-align: center;
    font-size: 9pt;
    line-height: 1.8;
    margin: 8pt 0 12pt;
}

.contact span {
    display: inline-block;
    margin: 0 5pt;
}

p {
    margin-top: 3pt;
    margin-bottom: 6pt;
    overflow-wrap: anywhere;
}

ul, ol {
    margin-top: 3pt;
    margin-bottom: 6pt;
    padding-left: 18pt;
}

li {
    margin-bottom: 3pt;
}

strong {
    color: #222222;
}

a {
    color: #17365D;
    text-decoration: none;
}

@media print {
    h2 {
        page-break-after: avoid;
    }

    p, li {
        orphans: 2;
        widows: 2;
    }
}
CSS

    # Convert Markdown into HTML.

    if ! pandoc "$md" \
        --from=markdown \
        --to=html5 \
        --standalone \
        --metadata title="Resume" \
        --css="$css" \
        --output="$html"; then

        echo "Failed to generate HTML."
        return
    fi

    # Generate the PDF.

    if ! chromium \
        --headless \
        --no-sandbox \
        --disable-gpu \
        --disable-dev-shm-usage \
        --no-pdf-header-footer \
        --allow-file-access-from-files \
        --print-to-pdf="$pdf" \
        "file://$html" >/dev/null 2>&1; then

        echo "PDF generation failed."
        return
    fi

    if [[ -s "$pdf" ]]; then
        echo
        echo "Resume PDF generated successfully."
        echo "Location: $pdf"
        echo "Source Markdown: $md"
        echo "HTML: $html"
    else
        echo "PDF was not created correctly."
    fi
}

while true; do
    echo
    echo "Resume Builder"
    echo "=============="
    echo "1. Create Resume Profile"
    echo "2. Modify Resume Profile"
    echo "3. List Resume Profiles"
    echo "4. Generate Resume PDF"
    echo "5. Exit"
    echo

    read -r -p "Choose an option: " choice

    case "$choice" in
        1) create_resume ;;
        2) edit_resume ;;
        3) list_resumes ;;
        4) generate_resume ;;
        5)
            echo "Exiting Resume Builder."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose 1 to 5."
            ;;
    esac
done

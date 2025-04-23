#!/bin/bash

# First download the animation script and then source it
BLA_SCRIPT="/tmp/bash_loading_animations.sh"
if ! wget -q https://raw.githubusercontent.com/Sxxrya666/practical-automate/main/bash_loading_animations.sh -O "$BLA_SCRIPT"; then
    echo "❌ Failed to download loading animations script"
    exit 1
fi
source "$BLA_SCRIPT"

trap BLA::stop_loading_animation SIGINT
# Exit immediately if any command fails
set -e

# Check if required commands are available
check_command() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "  Installing $1..."
        if sudo apt install -y "$1" >/dev/null 2>&1; then 
            echo "  ✅ Successfully installed $1"
        else 
            echo "  ❌ Failed to install $1. Please install it manually: sudo apt install $1"
            exit 1
        fi
    fi
}
check_command wget
check_command unzip

OPTSTRING="d"

while getopts ${OPTSTRING} option; do
    case ${option} in    
    d)
        echo -e "\e[3m\e[1m'-d' enabled!!\e[0m"
        
            sudo apt update -qq
            check_command tmux
            check_command neovim
            check_command zsh
        ;;
    *)
        echo "⚠️ Invalid option: -$OPTARG"
        exit 1 
        ;;
    esac
done 

# Download files with proper error handling
download_file() {
    local url="$1"
    local filename="$2"
    
    BLA::start_loading_animation "${BLA_semi_circle[@]}"
    echo "⬇️ Downloading $filename..."
    if ! wget --show-progress --content-disposition -q -O "$filename" "$url"; then
        BLA::stop_loading_animation 
        echo "❌ Error: Failed to download $filename from $url"
        exit 1
    fi
    BLA::stop_loading_animation
}

# File URLs and names
KRISHNA_URL="https://bit.ly/krishnbhaktigeet"
KRISHNA_ZIP="krishna-bhajans.zip"
SHIVA_URL="https://bit.ly/shivbhaktigeet"
SHIVA_ZIP="shiva-bhajans.zip"

# Download both files
download_file "$KRISHNA_URL" "$KRISHNA_ZIP"
download_file "$SHIVA_URL" "$SHIVA_ZIP"

# Create target directories
mkdir -p krishna-bhajans shiva-bhajans

# Extract files directly to target directories
BLA::start_loading_animation "${BLA_semi_circle[@]}"
    echo "   📦 Extracting files..."
    unzip -q -o "$KRISHNA_ZIP" -d krishna-bhajans/
    unzip -q -o "$SHIVA_ZIP" -d shiva-bhajans/
BLA::stop_loading_animation 

# Move contents from any -latest folders to main directory
BLA::start_loading_animation "${BLA_semi_circle[@]}"
for folder in krishna-bhajans shiva-bhajans; do
    for latest_dir in "$folder"/*-latest/; do
        if [ -d "$latest_dir" ]; then
            echo " 🔄 Moving files in $folder..."
            mv -f "$latest_dir"* "$folder"/
            rm -rf "$latest_dir"
        fi
    done
done
BLA::stop_loading_animation 


cd krishna-bhajans

cat <<EOF >'Assessing GDPR Compliance at Google and HIPAA Compliance in Healthcare: A Case Study Experiment.md'
# Experiment 10: Assessing GDPR and HIPAA Compliance

## AIM
Assessing GDPR Compliance at Google and HIPAA Compliance in Healthcare: A Case Study Experiment

## Learning Objectives
- To evaluate the effectiveness of Google's GDPR compliance measures
- To assess a healthcare organization's HIPAA compliance procedures
- To compare data protection approaches in different industries
- To identify best practices and challenges in regulatory compliance

## Theory

### 1. Google GDPR Compliance Assessment
- Review privacy policies and data handling practices
- Analyze data processing activities (collection, storage, sharing)
- Assess data protection measures:
  - Encryption standards
  - Access controls
  - Data breach response procedures
  - User consent mechanisms

### 2. Healthcare HIPAA Compliance Assessment
- Examine policies related to:
  - Privacy rules
  - Security standards
  - Breach notification requirements
- Evaluate risk analysis and management processes
- Assess implementation of safeguards:
  - Technical (encryption, access controls)
  - Administrative (training, policies)
  - Physical (facility security)

## Case Studies

### Google's GDPR Compliance
**Context:**
- Global technology company handling vast user data
- Processes personal details, search history, location data
- Essential for privacy protection and avoiding penalties

**Compliance Measures:**
- Data encryption implementation
- Granular access controls
- Transparent user consent management
- Enhanced user data controls

**Challenges:**
- Data-sharing with third-party advertisers
- Transparency in cross-service data processing
- User concerns about data usage

### Healthcare Organization's HIPAA Compliance
**Context:**
- Handles Protected Health Information (PHI)
- Uses electronic health record systems
- Critical for patient privacy and regulatory compliance

**Compliance Measures:**
- Encrypted communications
- Restricted PHI access
- Comprehensive audit logging
- Established breach notification procedures

**Challenges:**
- Employee training effectiveness
- Third-party vendor management
- Incident response capabilities

## Key Findings

### Challenges in Compliance
- Balancing legal, technical and operational requirements
- Managing large volumes of sensitive data
- Adapting to regulatory changes

### Importance of Transparency
- Clear communication of data practices
- User/patient awareness of data usage
- Accountability in data handling

### Risk Management
- Regular compliance audits
- Continuous employee training
- Vendor risk assessment
- Proactive policy updates

## Best Practices

### For Google (GDPR)
- Enhance data sharing transparency
- Strengthen user consent mechanisms
- Improve cross-service data processing clarity

### For Healthcare (HIPAA)
- Invest in comprehensive staff training
- Strengthen vendor management protocols
- Regular incident response testing
- Continuous risk assessment updates

## Conclusion
This comparative analysis demonstrates:
- Different approaches to data protection in tech vs healthcare
- Common challenges in maintaining compliance
- The critical role of transparency and risk management
- Industry-specific best practices for GDPR and HIPAA

Both sectors must continuously evolve their compliance strategies to address emerging threats and regulatory changes while maintaining trust with users/patients.
EOF
cd ..

echo -e "  🧹 Cleaning up..."
rm -f "$KRISHNA_ZIP" "$SHIVA_ZIP" "$BLA_SCRIPT"

# Final output
echo -e "\n🎉 All operations completed successfully!"

clear

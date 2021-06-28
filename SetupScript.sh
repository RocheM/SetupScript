# #!/bin/sh

# Homebrew Script for OSX
# To execute: save and `chmod +x ./SetupScript.sh` then `./SetupScript.sh`

options=(oracle-jdk mysql@5.7 intellij-idea docker)
selections=(N N)
installBrew=N


# Check for Homebrew
echo "Install Homebrew? (Y/N) NOTE: Required for this script to function."
read installBrew
if [[ $installBrew == "Y" || $installBrew == "y" ]]; then
    echo "Will Install Brew"
else
    echo "Will skip Brew Install"
fi

# Iterate through options to allow for user selection.
ITER=0
for i in "${options[@]}"
do
    echo "Install ${options[ITER]}? (Y/N)"
    read selections[ITER]
    if [[ ${selections[ITER]} == "Y" || ${selections[ITER]} == "y" ]]; then
            echo "Will install ${options[ITER]}"
    else
            echo "Won't Install ${options[ITER]}"
    fi
    ((ITER++))
done

# Install Homebrew
if [[ $installBrew == "Y" || $installBrew == "y" ]]; then
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"    
fi


#Install selected options
ITER=0
for i in "${options[@]}"
do
    if [[ ${selections[ITER]} == "Y" || ${selections[ITER]} == "y" ]]; then
            echo "Installing ${options[ITER]}"
            brew install ${options[ITER]}
    fi
    ((ITER++))
done
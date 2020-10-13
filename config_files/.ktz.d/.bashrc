# unlimited history
HISTSIZE=-1
HISTFILESIZE=-1
# ALIASES
alias sudo='sudo '
alias open='xdg-open'
alias ttmux='tmux attach'
alias sc='systemctl'
# ALIASES
# confirm command before executing from history
shopt -s histverify




NC='\033[0m'
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

function copyssh(){
    cp -f ~/.ktz.d/.ssh/config ~/.ssh/config
    cp -F ~/.ktz.d/.ssh/*_id_rsa ~/.ssh/
}

function ktzhelp(){
    echo -e "
    ${Green}WSL mount usb drive:
sudo mkdir /mnt/h && sudo mount -t drvfs H: /mnt/h
    ${Cyan}TMUX:
prefix z            ${Green}#Fullscreen current pane

    ${Cyan}Tmux-resurrect:
prefix C-s          ${Green}#Save environment
prefix C-r          ${Green}#Load environment

    ${Cyan}TMUX-VIM copy:
prefix+[, space, enter, prefix+]

    ${Cyan}VIM:
u                   ${Green}#Undo
C-r                 ${Green}#Redo
:set paste          ${Green}#Fix indentations when pasting via os clipboard

    ${Cyan}TAR:
tar -zxvf yourfile.tar.gz               ${Green}#Extract the file to the current directory
tar -C /myfolder -zxvf yourfile.tar.gz  ${Green}#Extract to specific directory
${Green}To extract ${Red}.tar${Green} file just drop ${Red}-z${Green} flag

    ${Cyan}BASH:
    ${Purple}Special parameters:
\$#     ${Green}#Number of arguments
\$!     ${Green}#PID of last backgroup process
\$?     ${Green}#Return code of last executed foreground-pipeline
\$-     ${Green}#Current \`set\` flags
\$\$     ${Green}#PID of the shell - better use \$BASHPID
\$*     ${Green}#All arguments
\$@     ${Green}#All arguments, starting from first
\$1     ${Green}#First argument
\$_     ${Green}#Last argument of the previous command

    ${Purple}Expansions:
!$          ${Green}#Expand last parameter of most recent command
!*          ${Green}#Expand all parameters of most recent command
!-n         ${Green}#Expand nth most recent command
!n          ${Green}#Expand nth command in history
!<command>  ${Green}#Expand most recent invocation of command <command>

    ${Purple}Glob:
shopt -s nullglob    ${Green}#Non-matching globs are removed  ('*.foo' => '')
shopt -s failglob    ${Green}#Non-matching globs throw errors
shopt -s nocaseglob  ${Green}#Case insensitive globs
shopt -s dotglob     ${Green}#Wildcards match dotfiles ("*.sh" => ".foo.sh")
shopt -s globstar    ${Green}#Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')

    ${Blue}Moving:
cd -                    ${Green}#Go to previous directory
pushd /path/to/foo/bar  ${Green}#Put current PWD on stack and got to directory
popd                    ${Green}#Get directory from the top of the stack and go there

    ${Blue}Redirections:
python hello.py > output.txt   ${Green}#Stdout to (file)
python hello.py >> output.txt  ${Green}#Stdout to (file), append
python hello.py 2> error.log   ${Green}#Stderr to (file)
python hello.py 2>&1           ${Green}#Stderr to stdout
python hello.py 2>/dev/null    ${Green}#Stderr to (null)
python hello.py &>/dev/null    ${Green}#Stdout and stderr to (null)
python hello.py < foo.txt      ${Green}#Feed foo.txt to stdin for python



    ${Purple}Brace expansion:
${Red}Brace expansion precedes any other expansion, so this does not work:
echo {\$a..\$b}
${Red}We have to evaluate whole line once again:
\$(eval echo {\$a..\$b})

touch test{1,2}.txt         ${Green}#Create files test1.txt and test2.txt
echo {1..5}                 ${Green}#Generate sequence 1 to 5
echo {01..5}                ${Green}#Generate sequence 1 to 5 with padding
echo {1..10..2}             ${Green}#Create sequence, with step 2
echo {10..1..2}             ${Green}#Shell determines step(inc/dec) from the range definition
echo {a..z}                 ${Green}#Create alphabetical sequence

${Yellow}\$ echo {I,want,my,money,back}
${Yellow}I want my money back

${Yellow}\$ echo _{I,want,my,money,back}
${Yellow}_I _want _my _money _back

${Yellow}\$ echo {I,want,my,money,back}_
${Yellow}I_ want_ my_ money_ back_

${Yellow}\$ echo _{I,want,my,money,back}-
${Yellow}_I- _want- _my- _money- _back-

${Yellow}\$ echo 1.{0..9}
${Yellow}1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9

${Yellow}\$ echo ---{A..E}---
${Yellow}---A--- ---B--- ---C--- ---D--- ---E---

${Yellow}\$ echo {A..Z}{0..9}
${Yellow}A0 A1 A2 A3 A4 A5 A6 A7 A8 A9 B0 B1 B2 B3 B4 B5 B6 B7 B8 B9 C0 C1 C2 C3 C4 C5 C6
${Yellow}C7 C8 C9 D0 D1 D2 D3 D4 D5 D6 D7 D8 D9 E0 E1 E2 E3 E4 E5 E6 E7 E8 E9 F0 F1 F2 F3
${Yellow}F4 F5 F6 F7 F8 F9 G0 G1 G2 G3 G4 G5 G6 G7 G8 G9 H0 H1 H2 H3 H4 H5 H6 H7 H8 H9 I0
${Yellow}I1 I2 I3 I4 I5 I6 I7 I8 I9 J0 J1 J2 J3 J4 J5 J6 J7 J8 J9 K0 K1 K2 K3 K4 K5 K6 K7
${Yellow}K8 K9 L0 L1 L2 L3 L4 L5 L6 L7 L8 L9 M0 M1 M2 M3 M4 M5 M6 M7 M8 M9 N0 N1 N2 N3 N4
${Yellow}N5 N6 N7 N8 N9 O0 O1 O2 O3 O4 O5 O6 O7 O8 O9 P0 P1 P2 P3 P4 P5 P6 P7 P8 P9 Q0 Q1
${Yellow}Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 R0 R1 R2 R3 R4 R5 R6 R7 R8 R9 S0 S1 S2 S3 S4 S5 S6 S7 S8
${Yellow}S9 T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 U0 U1 U2 U3 U4 U5 U6 U7 U8 U9 V0 V1 V2 V3 V4 V5
${Yellow}V6 V7 V8 V9 W0 W1 W2 W3 W4 W5 W6 W7 W8 W9 X0 X1 X2 X3 X4 X5 X6 X7 X8 X9 Y0 Y1 Y2
${Yellow}Y3 Y4 Y5 Y6 Y7 Y8 Y9 Z0 Z1 Z2 Z3 Z4 Z5 Z6 Z7 Z8 Z9

${Yellow}\$ echo {{A..Z},{a..z}}
${Yellow}A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z

    ${Purple}Substrings/Slicing:
\${FOO:0:3}         ${Green}#Substring (position, length)
\${FOO:(-3):3}      ${Green}#Substring from the right

${Yellow}name='John'
${Yellow}echo \${name:0:2}      ${Green}#\"Jo\"
${Yellow}echo \${name::2}       ${Green}#\"Jo\"
${Yellow}echo \${name::-1}      ${Green}#\"Joh\"
${Yellow}echo \${name:(-1)}     ${Green}#\"n\"
${Yellow}echo \${name:(-2):1}   ${Green}#\"h\"

${Yellow}STR='/path/to/foo.cpp'
${Yellow}echo \${STR%.cpp}      ${Green}# /path/to/foo
${Yellow}echo \${STR%.cpp}.o    ${Green}# /path/to/foo.o
${Yellow}echo \${STR%/*}        ${Green}# /path/to
${Yellow}echo \${STR##*.}       ${Green}# cpp (extension)
${Yellow}echo \${STR##*/}       ${Green}# foo.cpp (basepath)
${Yellow}echo \${STR#*/}        ${Green}# path/to/foo.cpp
${Yellow}echo \${STR##*/}       ${Green}# foo.cpp
${Yellow}echo \${STR/foo/bar}   ${Green}# /path/to/bar.cpp
${Yellow}BASE=\${SRC##*/}       ${Green}#\"foo.cpp\" (basepath)
${Yellow}DIR=\${SRC%$BASE}           ${Green}#\"/path/to/\" (dirpath)



    ${Purple}Manupulation:
STR=\"HELLO WORLD!\"
echo \${STR,}        ${Green}#\"hELLO WORLD!\" (lowercase 1st letter)
echo \${STR,,}       ${Green}#\"hello world!\" (all lowercase)

STR=\"hello world!\"
echo \${STR^}        ${Green}#\"Hello world!\" (uppercase 1st letter)
echo \${STR^^}       ${Green}#\"HELLO WORLD!\" (all uppercase)

    ${Purple}Default values:
\${FOO:-val}        ${Green}#\$FOO, or val if unset (or null)
\${FOO:=val}        ${Green}#Set \$FOO to val if unset (or null)
\${FOO:+val}        ${Green}#val if \$FOO is set (and not null)
\${FOO:?message}    ${Green}#Show error message and exit if \$FOO is unset (or null)
${Red}Omitting the \`:\` removes the (non)nullity checks, e.g. \${FOO-val} expands to val if unset otherwise \$FOO.

    ${Purple}Substitution
\${FOO%suffix}          ${Green}#Remove suffix
\${FOO#prefix}          ${Green}#Remove prefix
\${FOO%%suffix}         ${Green}#Remove long suffix
\${FOO##prefix}         ${Green}#Remove long prefix
\${FOO/from/to}         ${Green}#Replace first match
\${FOO//from/to}        ${Green}#Replace all
\${FOO/%from/to}        ${Green}#Replace suffix
\${FOO/#from/to}        ${Green}#Replace prefix

    ${Blue}Test:
    ${Purple}File conditions:
[[ -e FILE ]]           ${Green}#Exists
[[ -r FILE ]]           ${Green}#Readable
[[ -h FILE ]]           ${Green}#Symlink
[[ -d FILE ]]           ${Green}#Directory
[[ -w FILE ]]           ${Green}#Writable
[[ -s FILE ]]           ${Green}#Size is > 0 bytes
[[ -f FILE ]]           ${Green}#File
[[ -x FILE ]]           ${Green}#Executable
[[ FILE1 -nt FILE2 ]]   ${Green}#1 is more recent than 2
[[ FILE1 -ot FILE2 ]]   ${Green}#2 is more recent than 1
[[ FILE1 -ef FILE2 ]]   ${Green}#Same files

    ${Purple}Conditions:
[[ -z STRING ]]             ${Green}#Empty string
[[ -n STRING ]]             ${Green}#Not empty string
[[ STRING == STRING ]]      ${Green}#Equal
[[ STRING != STRING ]]      ${Green}#Not Equal
[[ NUM -eq NUM ]]           ${Green}#Equal
[[ NUM -ne NUM ]]           ${Green}#Not equal
[[ NUM -lt NUM ]]           ${Green}#Less than
[[ NUM -le NUM ]]           ${Green}#Less than or equal
[[ NUM -gt NUM ]]           ${Green}#Greater than
[[ NUM -ge NUM ]]           ${Green}#Greater than or equal
[[ STRING =~ STRING ]]      ${Green}#Regexp
(( NUM < NUM ))             ${Green}#Numeric conditions

    ${Blue}Arrays:
    ${Purple}Defining arrays:
Fruits=('Apple' 'Banana' 'Orange')
Fruits[0]='Apple'
Fruits[1]='Banana'
Fruits[2]='Orange'

    ${Purple}Access array:
\${Fruits[0]}           ${Green}#Element #0
\${Fruits[-1]}          ${Green}#Last element
\${Fruits[@]}           ${Green}#All elements, space-separated
\${#Fruits[@]}          ${Green}#Number of elements
\${#Fruits}             ${Green}#String length of the 1st element
\${#Fruits[3]}          ${Green}#String length of the Nth element
\${Fruits[@]:3:2}       ${Green}#Range (from position 3, length 2)
\${!Fruits[@]}          ${Green}#Keys of all elements, space-separated

    ${Purple}Array operations:
Fruits=(\"\${Fruits[@]}\" \"Watemelon\")     ${Green}#Push
Fruits+=('Watermelon')                  ${Green}#Also Push
Fruits=( \${Fruits[@]/Ap*/} )            ${Green}#Remove by regex match
unset Fruits[2]                         ${Green}#Remove one item
Fruits=(\"\${Fruits[@]}\")                 ${Green}#Duplicate
Fruits=(\"\${Fruits[@]}\" \"\${Veggies[@]}\") ${Green}#Concatenate
lines=(\`cat \"logfile\"\`)                 ${Green}#Read from file

    ${Purple}Iterate over array:
for i in \"\${arrayName[@]}\"; do
    echo \$i
done



    ${Blue}Dictionaries:
    ${Purple}Defining dict:
declare -A sounds
sounds[dog]='bark'
sounds[cow]='moo'
sounds[bird]='tweet'
sounds[wolf]='howl'

    ${Purple}Dict Operations:
\${sounds[dog]}     ${Green}#Dog's sound
\${sounds[@]}       ${Green}#All values
\${!sounds[@]}      ${Green}#All keys
\${#sounds[@]}      ${Green}#Number of elements
unset sounds[dog]  ${Green}#Delete dog

    ${Purple}Iterate over values
for val in \"\${sounds[@]}\"; do
    echo \$val
done
    ${Purple}Iterate over keys
for key in \"\${!sounds[@]}\"; do
    echo \$key
done



    ${Blue}Misc:
\$((\$RANDOM%200))           ${Green}#Random number 0..199
\${#FOO}                    ${Green}#Lenght of \$FOO
sudo -E bash               ${Green}#Switch to root & preserve environment
sed -i '\$a\' <file>        ${Green}#Add newline at the end if not present

${Red}Trap:
${Yellow}set -e
${Yellow}traperr() {
${Yellow}   echo \"ERROR: \${BASH_SOURCE[1]} at about \${BASH_LINENO[0]}\"
${Yellow}}
${Yellow}trap traperr ERR

${Red}Optargs:
while [[ \"\$1\" =~ ^- && ! \"\$1\" == \"--\" ]]; do case \$1 in
  -V | --version )
    echo \$version
    exit
    ;;
  -s | --string )
    shift; string=\$1
    ;;
  -f | --flag )
    flag=1
    ;;
esac; shift; done
if [[ \"\$1\" == '--' ]]; then shift; fi
${Red}Getopts:
while getopts \":s:p:\" o; do
    case \"\${o}\" in
        s)
            s=\${OPTARG}
            ((s == 45 || s == 90)) || usage
            ;;
        p)
            p=\${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift \$((OPTIND-1))

    ${Cyan}Git:
git diff --staged           ${Green}#See staged changes


" |& less --mouse -R -F -M;
}


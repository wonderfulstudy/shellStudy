files=`ls -U /usr/share/backgrounds | grep -v contest`
last_file="empty"

echo '<background>
  <starttime>
    <year>2009</year>
    <month>08</month>
    <day>04</day>
    <hour>00</hour>
    <minute>00</minute>
    <second>00</second>
  </starttime>
<!-- This animation will start at midnight. -->'

for current_file in $files
do
    if [[ $last_file = "empty" ]]
    then
        last_file=$current_file
    else
        echo "  <static>"
        echo "    <duration>300.0</duration>"
        echo "    <file>/usr/share/backgrounds/$last_file</file>"
        echo "  </static>"
        echo "  <transition>"
        echo "    <duration>0.5</duration>"
        echo "    <from>/usr/share/backgrounds/$last_file</from>"
        echo "    <to>/usr/share/backgrounds/$current_file</to>"
        echo "  </transition>"
        last_file=$current_file
    fi
done

echo "</background>"

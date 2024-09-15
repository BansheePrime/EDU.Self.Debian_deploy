write-host "1 - option 1"
write-host "2 - option 2"
write-host "3 - option 3"

write-host ""

$answer = read-host "Select number(s)"

$ok = $answer -match '[123]+$'
if ( -not $ok) {write-host "choose on of the options"
                sleep 3
                write-host ""
                }

$words = Invoke-WebRequest -UseBasicParsing -Uri http://www.mit.edu/~ecprice/wordlist.10000 | Select-Object -ExpandProperty Content
write-output "Working with $($words.length) words"
$wl = 1..$words.length

for ($a = 1; $a -lt 36; $a++) {
    write-output "I'm on iteration $a of Standard Desktop Mode"
    $random_n1 = get-random -input ($wl) -Count 5
    $phrase = -join ($words[$random_n1[0]]," ",$words[$random_n1[1]]," ",$words[$random_n1[2]]," ",$words[$random_n1[3]]," ",$words[$random_n1[4]])
    $random_time = get-random -minimum 20 -maximum 90

    Start-Process microsoft-edge:http://www.bing.com/search?q=$phrase

    write-output "Sleeping for $random_time seconds..."
    start-sleep $random_time
}

for ($a = 1; $a -lt 22; $a++) {
    write-output "I'm on iteration $a of Mobile (Chrome)"
    $random_number = get-random
    $random_n1 = get-random -input ($wl) -Count 5
    $phrase = -join ($words[$random_n1[0]]," ",$words[$random_n1[1]]," ",$words[$random_n1[2]]," ",$words[$random_n1[3]]," ",$words[$random_n1[4]])
    $random_time = get-random -minimum 20 -maximum 90

    & 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' http://www.bing.com/search?q=$phrase
    write-output "Sleeping for $random_time seconds..."
    start-sleep $random_time
}

write-output "All done with this round..."
start-sleep 10
start-process microsoft-edge:https://www.bing.com/rewards/dashboard

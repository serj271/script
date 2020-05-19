[System.Collections.Generic.SortedDictionary[int, String]]$dict =
    [System.Collections.Generic.SortedDictionary[int, String]]::new()
$dict.GetType().FullName
$dict.Add(1, 'a')
$dict.Add(2, 'b')
$dict.Add(3, 'c')
$dict.Add('4', 'd') #powershell auto converts '4' to 4
$dict.Add('5.1', 'c') #powershell auto converts '5.1' to 5
$dict
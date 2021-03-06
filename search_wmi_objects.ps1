function search {
    param([string] $_namespace, [string] $search_string)
    try {
        #Get-WmiObject -Namespace $_namespace -List -ErrorAction Stop | Sort-Object name | Select-String $search_string
        $list = Get-WmiObject -Namespace $_namespace -List -ErrorAction Stop | Sort-Object name | Select-String $search_string
        if($list.length -gt 1) {
            $list
        }
    } catch {
        Write-Warning "$_"
    }
}

$text = $args[0]
Get-WmiObject -Namespace root -Class __namespace | Sort-Object | ForEach-Object {
    $namespace = 'root\'+$_.name 
    search $namespace $text 
}
    
    


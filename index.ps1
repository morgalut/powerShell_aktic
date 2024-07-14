# Define the group name
$groupName = "YourGroupName"

# Get the group from Active Directory
$group = Get-ADGroup -Identity $groupName

if ($group) {
    Write-Output "Group '$groupName' found in Active Directory."

    # Get the "Member Of" information
    $memberOf = Get-ADGroup -Identity $groupName -Properties MemberOf

    if ($memberOf.MemberOf) {
        Write-Output "Group '$groupName' is a member of:"
        foreach ($parentGroup in $memberOf.MemberOf) {
            $parentGroupName = (Get-ADGroup -Identity $parentGroup).Name
            Write-Output $parentGroupName
        }
    } else {
        Write-Output "Group '$groupName' is not a member of any other group."
    }
} else {
    Write-Output "Group '$groupName' not found in Active Directory."
}

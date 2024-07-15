# Active Directory Group Membership Query

This project provides scripts and programs to register a group in Active Directory and find the "Member Of" groups for a specified Active Directory group. The project includes examples in both PowerShell and C#.

## PowerShell Script

### Description

The PowerShell script retrieves the specified Active Directory group and lists all the groups that the specified group is a member of.

### Usage

1. Open PowerShell.
2. Copy and paste the following script into your PowerShell session or save it as a `.ps1` file and run it.

```powershell
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

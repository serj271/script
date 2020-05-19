class ParentClass
{
    [string] $Message = "It's under the Parent Class"
    [string] GetMessage()
    {
    return ("Message: {0}" -f $this.Message)
    }
}
# Bar extends Foo and inherits its members
class ChildClass : ParentClass
{
}
$Inherit = [ChildClass]::new()

$Inherit.Message

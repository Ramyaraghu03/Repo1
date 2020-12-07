public class Example1 {
    public String name;
    public string getname()
    {
        return name;
    }
    public void setname(string name)
    {
        this.name=name;
    }
    public PageReference Show()
    {
        name = 'Display name' + name;
        return null;
    }

}
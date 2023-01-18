using Emscripten;

class HelloWorld
{
    public static int main(string[] args)
    {
        Intl.setlocale();
        stdout.printf("HW\n");
        string a = "";
        GLib.get_charset(out a);

        EM_ASM("console.log('test');");
        
        return 0;
    }
}

public class Poop : GLib.Object
{
    public Poop(){}

    ~Poop()
    {
        stdout.printf("destroyed.\n");
    }
}
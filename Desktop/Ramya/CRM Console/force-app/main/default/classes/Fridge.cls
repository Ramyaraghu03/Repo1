public class Fridge {

Private String modelNumber;
Private Integer numberInStock;
    Public void setmodelNum (String mn)
{
modelnumber=mn;
}

Public String getmodelnumber()
{
return modelnumber;
}

Public void setnumstock (integer n)
{
numberinstock=n;
}

Public integer getnumstock ()
{
return numberinstock;
}
public void updateStock(Integer justSold) 
 {
numberInStock = numberInStock - justSold;
 }
}
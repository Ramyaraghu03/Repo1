trigger Forceforcasting on User (before insert) {
    for(User UserinLoop : Trigger.New)
    {
        UserinLoop.ForecastEnabled = True ;
        userinLoop.CompanyName = 'Google';
    }

}
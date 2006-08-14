var drammen = null;
var stavanger = null;
var map = null;
var pinDrammen = null;
var pinStavanger =  null;

function loadMaps() {
    map = new VEMap('map');
    drammen = new VELatLong(59.756896, 10.267966);
    stavanger = new VELatLong(58.884387, 5.740382);
    pinDrammen = new VEPushpin(1, drammen,'http://www.jklm.no/ceag/images/Ceag_small.gif','Hovedkontor','COOPER Crouse-Hinds AS, Husebysletta 9, 3400 Lier');
    pinStavanger = new VEPushpin(2,stavanger,'http://www.jklm.no/ceag/images/Ceag_small.gif','Avdeling Sandnes','COOPER Crouse-Hinds AS, Torneroseveien 4, 4315 Sandnes');
    map.LoadMap(drammen, 14 ,'r' , false);
    map.AddPushpin(pinDrammen);
    map.AddPushpin(pinStavanger);
}

function loadDrammen() {
    if( map == null ) {
        loadMaps();
    }
    map.SetCenter(drammen);
}

function loadStavanger() {
    if( map == null ) {
        loadMaps();
    }
    map.SetCenter(stavanger);
}
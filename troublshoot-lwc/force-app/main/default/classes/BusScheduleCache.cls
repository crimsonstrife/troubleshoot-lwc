public class BusScheduleCache {
	private Cache.OrgPartition part;
    
    public BusScheduleCache(){
        Cache.OrgPartition initPart = new Cache.OrgPartition('local.BusSchedule');
        
        if (initPart != null){
            part = initPart;
        }
    }
    
    public void putSchedule(string busLine, Time[] schedule){
        if (part != null){
            part.put(busLine,schedule);
        }
    }
    
    public Time[] getSchedule(string busLine){
        Time[] bSched = new Time[]{};
        
        if (part != null && (Time[])part.get(busLine) != null){
        	bSched = (Time[])part.get(busLine);        
        } else{
            bSched.add(Time.newInstance(8,0,0,0));
            bSched.add(Time.newInstance(17,0,0,0));
        }
        
        return bSched;
    }
}
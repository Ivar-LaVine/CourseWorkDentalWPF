//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DentalCabinet.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class timetable
    {
        public int tim_id { get; set; }
        public Nullable<int> day_id { get; set; }
        public Nullable<int> doc_id { get; set; }
        public Nullable<System.TimeSpan> beg_time { get; set; }
        public Nullable<System.TimeSpan> end_time { get; set; }
    
        public virtual day day { get; set; }
        public virtual doctor doctor { get; set; }
    }
}
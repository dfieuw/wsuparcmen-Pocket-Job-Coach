//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PJCAdmin.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    
    public partial class prompt
    {
        public prompt()
        {
            this.usertaskprompts = new HashSet<usertaskprompt>();
        }
    

        public int promptID { get; set; }
        public int typeID { get; set; }
        public int taskID { get; set; }

        [DisplayName("Title")]
        public string title { get; set; }

        [DisplayName("URL")]
        public string description { get; set; }

        [DisplayName("Task")]
        public virtual task task { get; set; }

        [DisplayName("Prompt Type")]
        public virtual prompttype prompttype { get; set; }
        public virtual ICollection<usertaskprompt> usertaskprompts { get; set; }
    }
}

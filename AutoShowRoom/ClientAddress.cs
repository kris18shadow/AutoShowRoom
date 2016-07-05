namespace AutoShowRoom
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable]
    [Table("ClientAddress")]
    public partial class ClientAddress
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string City { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string ClientInfoID { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(50)]
        public string adress { get; set; }

        public virtual ClientInfo ClientInfo { get; set; }
    }
}

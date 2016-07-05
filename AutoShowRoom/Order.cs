namespace AutoShowRoom
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable]
    [Table("Order")]
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            Car = new HashSet<Car>();
        }

        [Column(TypeName = "date")]
        public DateTime date { get; set; }

        [Required]
        [StringLength(50)]
        public string price { get; set; }

        [Required]
        [StringLength(10)]
        public string clientInfo { get; set; }

        [StringLength(10)]
        public string orderID { get; set; }

        [Required]
        [StringLength(10)]
        public string orderedProducts { get; set; }

        [Required]
        [StringLength(10)]
        public string processedBy { get; set; }

        [Required]
        [StringLength(10)]
        public string showroomID { get; set; }

        public virtual AutoShowRoom AutoShowRoom { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Car> Car { get; set; }

        public virtual ClientInfo ClientInfo1 { get; set; }

        public virtual Employee Employee { get; set; }
    }
}

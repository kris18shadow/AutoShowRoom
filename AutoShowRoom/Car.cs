namespace AutoShowRoom
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable]
    [Table("Car")]
    public partial class Car
    {
        [Required]
        [StringLength(50)]
        public string brand { get; set; }

        [Required]
        [StringLength(50)]
        public string model { get; set; }

        [Required]
        [StringLength(10)]
        public string power { get; set; }

        [Required]
        [StringLength(50)]
        public string fuel { get; set; }

        public string description { get; set; }

        [Column("class")]
        [Required]
        [StringLength(10)]
        public string _class { get; set; }

        [Required]
        [StringLength(50)]
        public string price { get; set; }

        [Required]
        [StringLength(50)]
        public string color { get; set; }

        [Required]
        [StringLength(50)]
        public string weight { get; set; }

        [Required]
        [StringLength(10)]
        public string safetyRating { get; set; }

        public int seats { get; set; }

        [StringLength(10)]
        public string carID { get; set; }

        [Required]
        [StringLength(10)]
        public string addedBy { get; set; }

        [Required]
        [StringLength(10)]
        public string inStock { get; set; }

        [Column("new")]
        [Required]
        [StringLength(10)]
        public string _new { get; set; }

        public int totalOrders { get; set; }

        [Required]
        [StringLength(50)]
        public string countryOfOrigin { get; set; }

        [Required]
        [StringLength(10)]
        public string showroomID { get; set; }

        [StringLength(10)]
        public string orderID { get; set; }

        public virtual AutoShowRoom AutoShowRoom { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Order Order { get; set; }
    }
}

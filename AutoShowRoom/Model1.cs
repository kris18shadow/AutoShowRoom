namespace AutoShowRoom
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<AutoShowRoom> AutoShowRoom { get; set; }
        public virtual DbSet<Car> Car { get; set; }
        public virtual DbSet<ClientInfo> ClientInfo { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<ClientAddress> ClientAddress { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AutoShowRoom>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<AutoShowRoom>()
                .Property(e => e.showroomID)
                .IsFixedLength();

            modelBuilder.Entity<AutoShowRoom>()
                .HasMany(e => e.Car)
                .WithRequired(e => e.AutoShowRoom)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AutoShowRoom>()
                .HasMany(e => e.Employee)
                .WithRequired(e => e.AutoShowRoom)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AutoShowRoom>()
                .HasMany(e => e.Order)
                .WithRequired(e => e.AutoShowRoom)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Car>()
                .Property(e => e.power)
                .IsFixedLength();

            modelBuilder.Entity<Car>()
                .Property(e => e._class)
                .IsFixedLength();

            modelBuilder.Entity<Car>()
                .Property(e => e.safetyRating)
                .IsFixedLength();

            modelBuilder.Entity<Car>()
                .Property(e => e.carID)
                .IsFixedLength();

            modelBuilder.Entity<Car>()
                .Property(e => e.addedBy)
                .IsFixedLength();

            modelBuilder.Entity<Car>()
                .Property(e => e.inStock)
                .IsFixedLength();

            modelBuilder.Entity<Car>()
                .Property(e => e._new)
                .IsFixedLength();

            modelBuilder.Entity<Car>()
                .Property(e => e.showroomID)
                .IsFixedLength();

            modelBuilder.Entity<Car>()
                .Property(e => e.orderID)
                .IsFixedLength();

            modelBuilder.Entity<ClientInfo>()
                .Property(e => e.Address)
                .IsFixedLength();

            modelBuilder.Entity<ClientInfo>()
                .Property(e => e.OrderID)
                .IsFixedLength();

            modelBuilder.Entity<ClientInfo>()
                .HasMany(e => e.ClientAddress)
                .WithRequired(e => e.ClientInfo)
                .HasForeignKey(e => e.ClientInfoID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ClientInfo>()
                .HasMany(e => e.Order)
                .WithRequired(e => e.ClientInfo1)
                .HasForeignKey(e => e.clientInfo)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.employeeID)
                .IsFixedLength();

            modelBuilder.Entity<Employee>()
                .Property(e => e.showroomID)
                .IsFixedLength();

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Car)
                .WithRequired(e => e.Employee)
                .HasForeignKey(e => e.addedBy)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.Order)
                .WithRequired(e => e.Employee)
                .HasForeignKey(e => e.processedBy)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.clientInfo)
                .IsFixedLength();

            modelBuilder.Entity<Order>()
                .Property(e => e.orderID)
                .IsFixedLength();

            modelBuilder.Entity<Order>()
                .Property(e => e.orderedProducts)
                .IsFixedLength();

            modelBuilder.Entity<Order>()
                .Property(e => e.processedBy)
                .IsFixedLength();

            modelBuilder.Entity<Order>()
                .Property(e => e.showroomID)
                .IsFixedLength();

            modelBuilder.Entity<ClientAddress>()
                .Property(e => e.ClientInfoID)
                .IsFixedLength();
        }
    }
}

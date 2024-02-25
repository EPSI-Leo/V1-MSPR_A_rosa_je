﻿using System;
using System.Collections.Generic;
using Arosaje.ModelViews;
using Microsoft.EntityFrameworkCore;

namespace Arosaje.Entities;

public partial class ArosajeContext : DbContext
{
    public ArosajeContext()
    {
    }

    public ArosajeContext(DbContextOptions<ArosajeContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Advice> Advices { get; set; }

    public virtual DbSet<Plant> Plants { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Advice>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("advices");

            entity.HasIndex(e => e.IdUser, "id_user");

            entity.Property(e => e.Advice1)
                .HasColumnType("text")
                .HasColumnName("advice");
            entity.Property(e => e.Id)
                .HasMaxLength(191)
                .HasColumnName("id");
            entity.Property(e => e.IdPlant)
                .HasMaxLength(191)
                .HasColumnName("id_plant");
            entity.Property(e => e.IdUser)
                .HasMaxLength(191)
                .HasColumnName("id_user");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Plant>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("plants");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.BeginAt)
                .HasColumnType("date")
                .HasColumnName("beginAt");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.EndAt)
                .HasColumnType("date")
                .HasColumnName("endAt");
            entity.Property(e => e.IdUser)
                .HasMaxLength(255)
                .HasColumnName("id_user");
            entity.Property(e => e.Latitude).HasColumnName("latitude");
            entity.Property(e => e.Longitude).HasColumnName("longitude");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
            entity.Property(e => e.Picture).HasColumnName("picture");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.ToTable("users");

            entity.Property(e => e.Id)
                .HasMaxLength(191)
                .HasColumnName("id");
            entity.Property(e => e.Username)
                .HasMaxLength(255)
                .HasColumnName("username");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

IConfiguration configuration = builder.Configuration;

apelmusic.Models.CRUD.GetConfiguration(configuration);
apelmusic.Logics.EmailLogic.GetConfiguration(configuration);
apelmusic.Logics.UserLogic.GetConfiguration(configuration);
apelmusic.Logics.CourseLogic.GetConfiguration(configuration);
apelmusic.Logics.CategoryLogic.GetConfiguration(configuration);
apelmusic.Logics.PaymentMethodLogic.GetConfiguration(configuration);
apelmusic.Logics.JwtLogic.GetConfiguration(configuration);
apelmusic.Logics.InvoiceLogic.GetConfiguration(configuration);
// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        builder =>
        {
            builder
            .AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader();
        });
});

builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(o =>
{
    o.TokenValidationParameters = new TokenValidationParameters
    {
        // validate credential
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:SecretKey"])),
        // validate issuer
        ValidateIssuer = true,
        ValidIssuer = configuration["Jwt:Issuer"],
        // validate audience
        ValidateAudience = true,
        ValidAudience = configuration["Jwt:Audience"],
        // validate expire time
        ValidateLifetime = true,
        ClockSkew = TimeSpan.Zero,
    };
});

var app = builder.Build();
// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();


app.UseAuthentication();
app.UseAuthorization();

app.UseCors("AllowAll");

app.MapControllers();

app.Run();

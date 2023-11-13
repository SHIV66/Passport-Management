<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>


<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <a class="btn btn-primary btn-lg btn-block" href="ApplicantLogin.aspx">Existing user Login</a>
                        <a class="btn btn-warning btn-lg btn-block" href="Register.aspx">New user registration</a>
                        <button type="button" class="btn btn-success btn-lg btn-block">Check Appointment Status</button>
                        <a class="btn btn-info btn-lg btn-block"  href="ApplicationStatus.aspx">Track Application Status</a>
                    </div>
                    <div class="col-md-8">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="/resource/images/banner1.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="/resource/images/banner2.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="/resource/images/banner3.jpg" class="d-block w-100" alt="...">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <h2>About Passport Seva</h2>
                        
                            
<p>In recent years, the Government of India has taken many initiatives to usher in an era of e-Governance to improve the delivery of public services. The National e-Governance Plan (NeGP) includes many high impact e-Governance projects that have been identified as Mission Mode Projects (MMP's). One such project focuses on reforming Passport services in India.</p>

<p>The Ministry of External Affairs (MEA) is responsible for issuance of Passports to Indian Citizens through a network of 36 Passport offices across the Country and 190 Indian Missions and Posts abroad.</p>

<p>A Passport is an essential travel document for those who are traveling abroad for education, tourism, pilgrimage, medical attendance, business purposes and family visits. During the last few years, the growing economy and spreading globalization have led to an increased demand for Passport and related services. This increasing demand for passports and related services is coming from both large cities and smaller towns, creating a need for wider reach and availability. To augment and improve the delivery of passport services to Indian citizens, the Ministry of External Affairs (MEA) launched the Passport Seva Project (PSP) in May 2010.</p>

<p>The project has been implemented in a Public Private Partnership (PPP) mode with Tata Consultancy Services, selected through a public competitive procurement process. Under this program, the sovereign and fiduciary functions like verification, granting and issuing of passport have been retained by MEA. The ownership and strategic control of the core assets including data/information is with MEA.</p>

<p>Passport Seva enables simple, efficient and transparent processes for delivery of passport and related services. Apart from creating a countrywide networked environment for Government staff, it integrates with the State Police for physical verification of applicant's credentials and with India Post for delivery of passports.</p>
                        
                    </div>
                </div>
        </div>

    </div>
    </div>

</asp:Content>

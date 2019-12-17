<%-- 
    Document   : testJSP
    Created on : 11 Des 19, 8:43:05
    Author     : ASUS
--%>

<%@page import="models.Region"%>
<%@page import="models.Country"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp"></jsp:include>
<jsp:include page="templates/sidebar.jsp"></jsp:include>
<jsp:include page="templates/topbar.jsp"></jsp:include>
    <!-- MAIN CONTENT-->
    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="flash-data" data-flashdata="<%= request.getAttribute("flash")%>"> 
                <script>
                    const flashdata = $('.flash-data').data('flashdata');
                    if (flashdata) {
                        swal({
                            title: 'Information',
                            text: 'Success ' + flashdata,
                            type: 'success'
                        });
                    }
                </script>
            </div>


            <div class="row">
                <div class="col-md-12">
                    <div class="overview-wrap">
                        <h2 class="title-1">Country Data</h2>
                        <button type="button" class="btn btn-primary mb-1" data-toggle="modal" data-target="#countryModal">
                            Create
                        </button>
                    </div>
                </div>
            </div>
            <div class="row m-t-25">
                <div class="col-12">
                    <div class="table-responsive table--no-card m-b-30">
                        <table id="listItem" class="table table-borderless table-striped table-earning">
                            <% List<Country> countrys = (ArrayList<Country>) request.getAttribute("countries"); %>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Region</th>
                                    <th class="text-right">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Country country : countrys) {%>
                                <tr>
                                    <td><%=country.getCountryId()%></td>
                                    <td><%= country.getCountryName()%></td>
                                    <td>
                                        <%=  country.getRegionId().getRegionName()%>
                                    </td>
                                    <td class="text-right">
                                        <Button data-toggle="modal" data-id="<%= country.getCountryId()%>" data-target="#orderModal"
                                                data-toogle="tooltip" title="Edit" class="btn btn-success"><i class="fas fa-edit"></i></Button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="countryServlet?action=delete&id=<%= country.getCountryId()%> " 
                                           class="btn btn-danger tombol-hapus" data-toogle="tooltip" title="Delete"><i class="fas fa-trash"></i></a>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">

                        <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END MAIN CONTENT-->


<!-- modal country large -->
<div class="modal fade" id="countryModal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="largeModalLabel">Add New Country</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="countryServlet?action=insert" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label>Country Name</label>
                        <input class="au-input au-input--full" type="text" name="countryName" id="countryName" placeholder="Country Name">
                    </div>
                    <div class="form-group">
                        <label>Region Name</label>
                        <% List<Region> regions = (ArrayList<Region>) request.getAttribute("regions"); %>
                        <select class="au-input au-input--full" name="regionId" id="regionId">
                            <%for (Region region : regions) {%>
                            <option value="<%= region.getRegionId()%>"><%= region.getRegionName()%></option>
                            <% }%>
                        </select>

                    </div>
            </div>
            <div class="modal-footer">
                <input type="submit" name="submit" value="Save" class="btn btn-primary "/>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end modal large -->



<!-- memulai modal nya. pada id="$myModal" harus sama dengan data-target="#myModal" pada tombol di atas -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Edit Location</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- memulai untuk konten dinamis -->
            <!-- lihat id="data_siswa", ini yang di pangging pada ajax di bawah -->
            <div class="modal-body" id="data">

            </div>
            <!-- selesai konten dinamis -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<!--JS Datatables-->
<script type="text/javascript">
    $(document).ready(function () {
        $('#listItem').DataTable(
                {
                    "columnDefs": [
                        {"orderable": false, "targets": 3}
                    ]
                }
        );
    });
</script>
<script>
    $('.tombol-hapus').on('click', function () {
        event.preventDefault();

        const href = $(this).attr("href");
        swal({
            title: 'Are you sure?',
            text: "Delete Data",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.value) {
                window.location.href = href;
            }
        });
    });
</script>


<jsp:include page="templates/footer.jsp"></jsp:include>

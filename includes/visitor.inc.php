<?php
    if(isset($_POST['visitor_add'])){
        require 'dbh.inc.php';
        
        $f_name=$_POST['f_name'];
        $l_name=$_POST['l_name'];
        $date_in=$_POST['date_in'];
        $prisoner_id=$_POST['prisoner_id'];
    if(empty($f_name)||empty($l_name)||empty($date_in)||empty($prisoner_id)){              
            
            header("Location: ../visitor.php?error=emptyfields");
            exit();
        }else{
                
                $sql="INSERT INTO Visitor(First_name,Last_name,Visit_date,Prisoner_id) VALUES
                (?,?,?,?) ";
                $stmt=mysqli_stmt_init($conn);
                if(!mysqli_stmt_prepare($stmt,$sql)){
                    header("Location: ../visitor.php?error=sqlerror");
                    exit();
                }else{
                    
                    mysqli_stmt_bind_param($stmt,"sssi",$f_name,$l_name,$date_in,$prisoner_id);
                    mysqli_stmt_execute($stmt);
                    header("Location: ../success_visitor.php?insert=success");
                    exit();

                }

        }
    }
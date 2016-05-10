#format of datafile: 1st_lab, 2nd_lab, test12, attendance, name

awk '{ 
  req_3rd_test_score=0;
  letter_grade="N/A";
  test_points_needed=0;
  pts_for_A=0;
  pts_for_B=0;
  pts_for_C=0;
  pts_for_D=0;
  lab_sum1=$1; 
  lab_sum2=$2; 
  total_lab_points=122
  total_test_points=300
  test12_sum=$3; 
  attendance=$4; 
  name=$5;
  C=70;
  B=80;
  A=90;
  lab_total=lab_sum1+lab_sum2; 
  lab_avg=(lab_total/total_lab_points)
  lab_points=(lab_avg*40);
  test_avg=(test12_sum/200);
  test_points=(test12_sum/300) * 55;
  attendance_points=(attendance * 5);
  grade_without_final=attendance_points+test_points+lab_points;
  if (grade_without_final < 90) {
    letter_grade="B";
    test_points_needed=((90-lab_points) - attendance_points);
    req_3rd_test_score=(((test_points_needed/.55)*3)-test12_sum);
    pts_for_A=req_3rd_test_score;
    # figure out how many points to A }
  } else { letter_grade="A"; }
  if (grade_without_final < 80)  {
    # figure out how many points to B 
    letter_grade="C";
    test_points_needed=((80-lab_points) - attendance_points);
    req_3rd_test_score=(((test_points_needed/.55)*3)-test12_sum);
    pts_for_B=req_3rd_test_score;
  } else { pts_for_B=0; } 
  if (grade_without_final < 70) {
    #figure out how many points to C 
    letter_grade="D";
    test_points_needed=((70-lab_points) - attendance_points);
    req_3rd_test_score=(((test_points_needed/.55)*3)-test12_sum);
    pts_for_C=req_3rd_test_score;
  } else { pts_for_C=0; }
  if (grade_without_final < 60) {
    #figure out how many points to D }
    letter_grade="F";
    test_points_needed=((60-lab_points) - attendance_points);
    req_3rd_test_score=(((test_points_needed/.55)*3)-test12_sum);
    pts_for_D=req_3rd_test_score;
  }
  if (name != "") {
    printf "<tr><td><u>%-12s</u></td> <td>current grade: %3.2f <u><b>%1s</u></b></td> <td><b>A:</b> %3.2f</td> <td><b>B:</b> %3.2f</td></tr><tr><td>lab_average=%3.3f</td><td>test average=%3.3f</td><td> <b>C:</b> %3.2f</td> <td><b>D:</b> %3.2f</td></tr>\n",name, grade_without_final,letter_grade, pts_for_A, pts_for_B, lab_avg, test_avg, pts_for_C,pts_for_D;
  }

}' gradefile

;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TORQYFC1^INT^1^59547,74875^0
%SCFC1 ;;1;106
 ;;^%SCRE("TORQY2")=9
 ;;^%SCRE("TORQY2",1)=INDEX
 ;;^%SCRE("TORQY2",1,1)=ETUDE : 
 ;;^%SCRE("TORQY2",1,2)=3
 ;;^%SCRE("TORQY2",1,3)=9
 ;;^%SCRE("TORQY2",1,4)=NUM^TORQY7(RESUL(IC))
 ;;^%SCRE("TORQY2",1,5)=@NU
 ;;^%SCRE("TORQY2",1,6)=0
 ;;^%SCRE("TORQY2",1,"ESPACE")=4,29
 ;;^%SCRE("TORQY2",1,"MODAFF")=BLD
 ;;^%SCRE("TORQY2",2)=INDEX
 ;;^%SCRE("TORQY2",2,1)=REP.RECEPTEUR : 
 ;;^%SCRE("TORQY2",2,2)=3
 ;;^%SCRE("TORQY2",2,3)=11
 ;;^%SCRE("TORQY2",2,4)=PREC^%VY(IC),REP^TORQY7(RESUL(IC))
 ;;^%SCRE("TORQY2",2,5)=
 ;;^%SCRE("TORQY2",2,6)=0
 ;;^%SCRE("TORQY2",2,"ESPACE")=4,49
 ;;^%SCRE("TORQY2",2,"MODAFF")=BLD
 ;;^%SCRE("TORQY2",3)=INDEX
 ;;^%SCRE("TORQY2",3,1)=INDIVIDU RECEPTEUR : 
 ;;^%SCRE("TORQY2",3,2)=40
 ;;^%SCRE("TORQY2",3,3)=11
 ;;^%SCRE("TORQY2",3,4)=PREC^%VY(IC),IND^TORQY7(RESUL(IC))
 ;;^%SCRE("TORQY2",3,5)=
 ;;^%SCRE("TORQY2",3,6)=0
 ;;^%SCRE("TORQY2",3,"ESPACE")=50,77
 ;;^%SCRE("TORQY2",3,"MODAFF")=BLD
 ;;^%SCRE("TORQY2",4,1)=GAMME : 
 ;;^%SCRE("TORQY2",4,2)=35
 ;;^%SCRE("TORQY2",4,3)=9
 ;;^%SCRE("TORQY2",4,4)=GAMME^TORQY7(RESUL(IC))
 ;;^%SCRE("TORQY2",4,5)=@GAMM
 ;;^%SCRE("TORQY2",4,6)=0
 ;;^%SCRE("TORQY2",4,"ESPACE")=29,49
 ;;^%SCRE("TORQY2",5,1)=REP.REC.OPERATION : 
 ;;^%SCRE("TORQY2",5,2)=41
 ;;^%SCRE("TORQY2",5,3)=18
 ;;^%SCRE("TORQY2",5,4)=REPF^TORQY7(RESUL(IC))
 ;;^%SCRE("TORQY2",5,5)=
 ;;^%SCRE("TORQY2",5,6)=0
 ;;^%SCRE("TORQY2",5,"ESPACE")=40,78
 ;;^%SCRE("TORQY2",6,1)=NOMENCLATURE : 
 ;;^%SCRE("TORQY2",6,2)=50
 ;;^%SCRE("TORQY2",6,3)=9
 ;;^%SCRE("TORQY2",6,4)=NOMENC^TORQY7(IC)
 ;;^%SCRE("TORQY2",6,5)=@NOMENC
 ;;^%SCRE("TORQY2",6,6)=0
 ;;^%SCRE("TORQY2",7,1)=LIEN NOMENCLATURE :
 ;;^%SCRE("TORQY2",7,2)=41
 ;;^%SCRE("TORQY2",7,3)=16
 ;;^%SCRE("TORQY2",7,4)=LIEN^TORQY7(IC)
 ;;^%SCRE("TORQY2",7,5)=
 ;;^%SCRE("TORQY2",7,6)=0
 ;;^%SCRE("TORQY2",7,"ESPACE")=40,78
 ;;^%SCRE("TORQY2",8,1)=REP.REC.NOMENCLATURE : 
 ;;^%SCRE("TORQY2",8,2)=3
 ;;^%SCRE("TORQY2",8,3)=16
 ;;^%SCRE("TORQY2",8,4)=RRN^TORQY7(IC)
 ;;^%SCRE("TORQY2",8,5)=
 ;;^%SCRE("TORQY2",8,6)=0
 ;;^%SCRE("TORQY2",8,"ESPACE")=4,46
 ;;^%SCRE("TORQY2",9,1)=REP.REC.GAMME :
 ;;^%SCRE("TORQY2",9,2)=3
 ;;^%SCRE("TORQY2",9,3)=18
 ;;^%SCRE("TORQY2",9,4)=REPG^TORQY7(IC)
 ;;^%SCRE("TORQY2",9,5)=
 ;;^%SCRE("TORQY2",9,6)=0
 ;;^%SCRE("TORQY2",9,"ESPACE")=4,46
 ;;^%SCRE("TORQY2","DERNIER ACCES")=01/08/89 a 10H25
 ;;^%SCRE("TORQY2","GLOSTOC")=^TORQY
 ;;^%SCRE("TORQY2,COMMENT")=3
 ;;^%SCRE("TORQY2,COMMENT",1,1)=~KL~1~78~1~5
 ;;^%SCRE("TORQY2,COMMENT",1,2)=1
 ;;^%SCRE("TORQY2,COMMENT",1,3)=1
 ;;^%SCRE("TORQY2,COMMENT",1,"MODAFF")=BLD
 ;;^%SCRE("TORQY2,COMMENT",2,1)=T R A N S F E R T    T O T E M  ---->  D K B M S
 ;;^%SCRE("TORQY2,COMMENT",2,2)=16
 ;;^%SCRE("TORQY2,COMMENT",2,3)=3
 ;;^%SCRE("TORQY2,COMMENT",3,1)=~KSP~
 ;;^%SCRE("TORQY2,COMMENT",3,2)=0
 ;;^%SCRE("TORQY2,COMMENT",3,3)=22
 ;;^%SCRE("TORQY2,COMMENT",3,4,1)=~L~H~76~2~7
 ;;^%SCRE("TORQY2,COMMENT",3,4,2)=~L~H~33~2~13
 ;;^%SCRE("TORQY2,COMMENT",3,4,3)=~L~H~4~36~13
 ;;^%SCRE("TORQY2,COMMENT",3,4,4)=~L~H~37~41~13
 ;;^%SCRE("TORQY2,COMMENT",3,4,5)=~L~H~33~2~14
 ;;^%SCRE("TORQY2,COMMENT",3,4,6)=~L~H~4~36~14
 ;;^%SCRE("TORQY2,COMMENT",3,4,7)=~L~H~37~41~14
 ;;^%SCRE("TORQY2,COMMENT",3,4,8)=~L~H~76~2~20
 ;;^%SCRE("TORQY2,COMMENT",3,4,10)=~L~V~5~1~8
 ;;^%SCRE("TORQY2,COMMENT",3,4,11)=~L~V~5~1~15
 ;;^%SCRE("TORQY2,COMMENT",3,4,12)=~L~V~5~78~8
 ;;^%SCRE("TORQY2,COMMENT",3,4,13)=~L~V~5~78~15
 ;;^%SCRE("TORQY2,COMMENT",3,4,15)=~KS~l~1~7
 ;;^%SCRE("TORQY2,COMMENT",3,4,16)=~KS~m~1~13
 ;;^%SCRE("TORQY2,COMMENT",3,4,17)=~KS~l~1~14
 ;;^%SCRE("TORQY2,COMMENT",3,4,18)=~KS~m~1~20
 ;;^%SCRE("TORQY2,COMMENT",3,4,19)=~KS~w~35~13
 ;;^%SCRE("TORQY2,COMMENT",3,4,20)=~KS~v~35~14
 ;;^%SCRE("TORQY2,COMMENT",3,4,21)=~KS~w~40~13
 ;;^%SCRE("TORQY2,COMMENT",3,4,22)=~KS~v~40~14
 ;;^%SCRE("TORQY2,COMMENT",3,4,23)=~KS~k~78~7
 ;;^%SCRE("TORQY2,COMMENT",3,4,24)=~KS~j~78~13
 ;;^%SCRE("TORQY2,COMMENT",3,4,25)=~KS~k~78~14
 ;;^%SCRE("TORQY2,COMMENT",3,4,26)=~KS~j~78~20


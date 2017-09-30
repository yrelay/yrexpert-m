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

;%QUECAFF^INT^1^59547,73885^0
QUECAFF(CL,RESUL,EXT,EV) ;;11:59 AM  1 Jul 1996
 
 
 
 
 
 
 
 N ECR,FG,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S FG=$$CONCAS^%QZCHAD(TEMP,"FG")
 S ECR=$$ECR^%QUECZ1
 
 D FGCO^%QUECZ1(CL,FG)
 D CLFEN^%VVIDEO(@FG@("XG"),@FG@("YH"),@FG@("H"),@FG@("L"))
 
 D FDAFF1(CL)
 
 D ^%QUECAF1(CL,RESUL,EXT,EV)
 Q
 
FDAFF1(CL) 
 N FD,I,FDAD
 S FDAD=$$FD^%QUECZ1(CL)
 S FD=$O(@FDAD@(""))
 F I=0:0 Q:FD=""  D FDAFF(CL,FD) S FD=$O(@FDAD@(FD))
 Q
 
 
 
 
FDAFF(CL,FD) 
 N FDAD,FDAD1,I,MAFF,MAFF1
 S FDAD="FDAD1"
 D FDCO^%QUECZ1(CL,FD,.TYPE,FDAD)
 I TYPE="RECTANGLE" G FDREC
 I TYPE="COMMENTAIRE" G FDCOMM
 Q
 
FDREC 
 D CARSP^%VVIDEO(@FDAD@("XG"),@FDAD@("YH"),@FDAD@("H"),@FDAD@("L"),0)
 Q
 
FDCOMM 
 N A
 S A=$$XY^%VVIDEO1(@FDAD@("XG"),@FDAD@("YH"))
 W A
 S MAFF1=@FDAD@("MODAFF")
 S MAFF=$O(@MAFF1@(""))
 F I=0:0 Q:MAFF=""  D @(@MAFF1@(MAFF)_"^%VVIDEO") S MAFF=$O(@MAFF1@(MAFF))
 
 W A
 W @FDAD@("LIB")
 D NORM^%VVIDEO
 Q


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

;%QUECX1^INT^1^59547,73885^0
QUECX1(CL,RESUL,EXT) 
 
 
 
 
 
 
 
 
 
 N TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 
 D ^%QUECAFF(CL,RESUL,EXT,1)
 D SAISIE(CL,RESUL,EXT)
 Q
 
SAISIE(CL,RESUL,EXT) 
 N REAF,CH1,I,CH,CURCP
 
 S REAF="^%QUECAFF("_$$S1^%QZCHAD(CL)_","_$$S1^%QZCHAD(RESUL)_","_$$S1^%QZCHAD(EXT)_",1)"
 
 S CH1=$$CH^%QUECZ1(CL)
 
 S CH=$O(@CH1@(""))
 I CH="" Q
 
 S CURCP=$$CURCP^%QUECZ1(CL)
 
 D CHAFF^%QUECAF1(CL,CH,RESUL,EXT,2)
 
 
 
 F I=0:0 Q:$$SAIS1(CH1,CURCP,.CH)
 Q
 
 
SAIS1(CH1,CURCP,CH) 
 N TOUCHE,FLECHE,CTR,ESC,A
 S A=$$MORE^%VZATOU(.TOUCHE,.FLECHE,.CTR,.ESC,"",0)
 I A'=1 Q 0
 
 I FLECHE="H" S CH=$$H^%QUECAF2(CURCP,CH) D CHAFF^%QUECAF1(CL,CH,RESUL,EXT,2) Q 0
 I FLECHE="G" S CH=$$G^%QUECAF2(CURCP,CH) D CHAFF^%QUECAF1(CL,CH,RESUL,EXT,2) Q 0
 I FLECHE="B" S CH=$$B^%QUECAF2(CURCP,CH) D CHAFF^%QUECAF1(CL,CH,RESUL,EXT,2) Q 0
 I FLECHE="D" S CH=$$D^%QUECAF2(CURCP,CH) D CHAFF^%QUECAF1(CL,CH,RESUL,EXT,2) Q 0
 
 I CTR="I" D CHS(CL,CH,RESUL,EXT,REAF) S CH=$$B^%QUECAF2(CURCP,CH) D CHAFF^%QUECAF1(CL,CH,RESUL,EXT,1) Q 0
 
 I (CTR="A")!(CTR="F") Q 1
 
 I CTR="R" D ^%QUECAFF(CL,RESUL,EXT,1)
 Q 0
 
 
PREC(CH1,CH) 
 S CH=$ZP(@CH1@(CH))
 I CH="" S CH=$ZP(@CH1@(CH))
 Q
 
 
NEXT(CH1,CH) 
 S CH=$O(@CH1@(CH))
 I CH="" S CH=$O(@CH1@(CH))
 Q
 
CHS(CL,CH,RESUL,EXT,REAF) 
 N CHAD,CHCO,CHCO1,UCS
 S CHCO="CHCO1"
 S CHAD=$$CH^%QUECZ1(CL)
 S UCS=$$UC^%QUECZ1(CL,CH)
 D CHCO^%QUECZ1(CL,CH,.TYPE,CHCO)
 I TYPE="VALEUR" D CHSVA(CL,CH,TYPE,CHAD,RESUL,EXT,REAF,UCS)
 Q
 
 
CHSVA(CL,CH,TYPE,CHAD,RESUL,EXT,REAF,UCS) 
 N VAL,VAL1,UCONT1
 S UCONT1="$$UC^%QUECX1(UCS,RESUL,EXT)"
 S VAL=$$EVAL^%QUECEV(CL,CH,TYPE,CHAD,RESUL,EXT)
 D LIRE2^%VREAD(@CHAD@(CH,"LIB"),VAL,@CHAD@(CH,"XG"),(@CHAD@(CH,"XG")+@CHAD@(CH,"L"))-1,(@CHAD@(CH,"YH")+@CHAD@(CH,"H"))-1,@CHAD@(CH,"YH"),REAF,UCONT1,.CTR,.VAL1)
 I CTR="A" Q
 D STO^%QUECEV(CL,CH,TYPE,CHAD,RESUL,VAL1,EXT)
 Q
 
 
 
 
 
 
UC(UCS,RESUL,EXT,YY1,REAF) 
 N UCO,UC,I
 S REAFF=0,FIN=0,OK=1
 S UCO=$O(@UCS@(""))
 F I=0:0 Q:UCO=""  Q:OK=0  D @@UCS@(UCO) S UCO=$O(@UCS@(UCO))
 Q OK
 
 
TEST S CL="EC2",RESUL="RESUL1",EXT="EXT1"
 S @RESUL@("EC1","CH1")="TAGADA"
 D ^%QUECX1(CL,RESUL,EXT)
 Q


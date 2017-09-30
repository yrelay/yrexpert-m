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

;%MZPASS^INT^1^59547,73872^0
MOZPASS ;
 
 
 
 
 
MACH 
 N MACH
 D ^TORQSTR
 S MACH="" F I=1:1 S MACH=$O(^[QUI]DESMACH(MACH)) Q:MACH=""
 S DX=10,DY=9 X XY W "Nombre d'outils traites : "_I
 G FIN
 
OUT 
 N GLO,GLOSTOC,%U,FAMILLE,CPT
 D CLEPAG^%VVIDEO,^%VZCD0("Transfert d'OutilS"),^%VZEATT
 S GLOSTOC=^%SCRE("DESOUT","GLOSTOC")
 
 
 
 
 S OUTI="" F %U=0:0 S OUTI=$$NXTRI^%QSTRUC8("OUTILLAGE",OUTI) Q:(OUTI="")!(OUTI="z")  K @GLOSTOC@(OUTI)
 S OUTI="",CPT=0,DX=10,DY=9 X XY W "Nombre d'outils traites : "
OUT1 
 S OUTI=$$NXTRI^%QSTRUC8("OUTILLAGE",OUTI)
 G:OUTI="" FIN
 S FAMILLE=$$^%QSCALVA("OUTILLAGE",OUTI,"FAMILLE")
 I FAMILLE="" S FAMILLE=OUTI D PA^%QSGESTI("OUTILLAGE",OUTI,"FAMILLE",FAMILLE,1)
 S CPT=CPT+1 D MAJOUT
 G OUT1
 
FIN D POCLEPA^%VVIDEO W "Mise a jour terminee !!!" R *I
 Q
 
MAJOUT 
 S DX=36,DY=9 X XY W CPT
 S @GLOSTOC@(OUTI,FAMILLE)=$$VAL("DESOUT")
 Q
VAL(S) N I,J,K,G S J=^%SCRE(S),K=""
 F I=2:1:J S K=K_$S($D(^%SCRE(S,I,"QUERY")):$C(26),1:"")_"^"
 Q K


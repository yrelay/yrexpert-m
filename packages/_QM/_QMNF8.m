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

;%QMNF8^INT^1^59547,73879^0
QMNF8 ;
 
 
 
 
 
 
VISU 
 N REP,BASI,REPD,BASID,IND,IND2,LIEN,SCR,ABENDSCR
 N TEMP,NOMENC,PROFMX,TABLIEN,TOTAL,TYPE,ORDRE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S NOMENC=$$CONCAS^%QZCHAD(TEMP,"NOMENC")
 S TABLIEN=$$CONCAS^%QZCHAD(TEMP,"TABLIEN")
 D CLEPAG^%VVIDEO
VISU2 S SCR="QMNFNO1"
 Q:'($D(^%SCRE(SCR)))
 K RESUL
 S RESUL(3)="CONSULTATION"
 D AFF^%VACTGRQ(SCR,.RESUL)
 Q:ABENDSCR
 Q:(RESUL(1)="")!(RESUL(2)="")
GR2 S REP=RESUL(1),BASI=$$NOMINT^%QSF(REP),LIEN=RESUL(2)
 S BASID=$$REPD^%QSGEL2(BASI,LIEN),REPD=$$NOMLOG^%QSF(BASID)
 S SCR="QMNFNO2"
 K RESUL
 S RESUL(1)=LIEN,RESUL(2)=REP,RESUL(4)=REPD
VISU3 D AFF^%VACTGRQ(SCR,.RESUL)
 Q:ABENDSCR
 I RESUL(3)="" G VISU2
 S IND=RESUL(3),IND2=""
 I '($$IR^%QSGE5(BASI,IND)) S IND=$$M^%QAX(IND)
 I '($$CONS2) G VISU3
 S RESUL(5)=IND2
 D ^%VAFISCR
ARB 
 K @(NOMENC)
 
 D ^%QMNF4(BASI,IND,LIEN,NOMENC,.PROFMX) I %ABORT G ARB2
 D ^%QMNF5(NOMENC,BASI,IND,LIEN,PROFMX)
 D CLEPAG^%VVIDEO,^%VZEATT H 1
ARB2 K @(NOMENC)
 D POCLEPA^%VVIDEO
 D REAFF
 G GR2
 
REAFF 
 S SCR="QMNFNO1"
 K RESUL
 S RESUL(3)="CONSULTATION"
 S RESUL(1)=REP,RESUL(2)=LIEN
 D ^%VAFIGRI,^%VAFISCR
 Q
 
 
CONS2() 
 D ^%VZEATT S TOTAL=0
 
 K @(TABLIEN)
 D MVG^%QSCALVA(BASI,IND,LIEN,TABLIEN,.TYPE)
 S TOTAL=@TABLIEN I TOTAL=0 D ^%VZEAVT($$^%QZCHW("Aucun lien")_" "_LIEN_" "_$$^%QZCHW("n'a ete defini pour l'individu")_" "_IND_"...") Q 0
 
 
 S ORDRE=$O(@TABLIEN@("")),IND2=@TABLIEN@(ORDRE)
 Q 1


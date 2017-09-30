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
 ;
 ; QUI        - Nom de la base de données utilisateur
 ;
 ; Paramètre d'entrée
 ; ==================
 ; BA  - Nom du répertoire dans le shéma de données
 ; ATR - Nom de l'individu dans le répertoire
 ; VAL - Nom de l'attribut de l'individu
 ;
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QMDAUC^INT^1^59547,73877^0
%QMDAUC ;
 
REP(VAL) 
 Q:VAL="*"
 I VAL'="?" S %QUE=VAL G EXIS
 S REFUSE=1 D ^%QSCHQUE,CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR Q:%QUE=""
 S TAB(IC)=%QUE D ^%VAFFICH S REFUSE=0 Q
EXIS S REFUSE='($$REP^%QSGEST5($$NOMINT^%QSF(%QUE))) I REFUSE D ^%VZEAVT($$^%QZCHW("Ce repertoire n'existe pas"))
 Q
 
CPL(IND) 
 Q:$P(IND,"/",2)="*"
 I $$IR^%QSGEST5("ATTRIBUT",IND) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Ce couple existe deja")) Q
 Q
 
INT(F) 
 I F="" S REFUSE=1 Q
 I F="?" D LIST,^%VAFIGRI,^%VAFISCR S REFUSE=1 Q
 S REFUSE='($$EX(F)) I REFUSE=1 D ^%VZEAVT($$^%QZCHW("Format inconnu")) Q
 N ICB S ICB=ICC,ICC=4,(RESUL(ICC),TAB(ICC))=$J("",25)
 D NORM^%VVIDEO,^%VAFFICH
 S (RESUL(ICC),TAB(ICC))=^RQSGLU("QMDA","FORM",F) D ^%VAFFICH
 S ICC=ICB Q
LIST 
 N LI S LI=""
 D CLEPAG^%VVIDEO,CORPS(.LI),^%VZEAVT(""),CLEPAG^%VVIDEO,CORPS(.LI),^%VZEAVT(""),CLEPAG^%VVIDEO Q
 
CORPS(FO) 
 N %F,DX,NOL
 I FO'="" S FO=$ZP(^RQSGLU("QMDA","FORM",FO))
 S NOL=1
 S DX=30,DY=2 X XY D BLD^%VVIDEO,REV^%VVIDEO W ?30,$$^%QZCHW("Formats d'affichage") D NORM^%VVIDEO
 W !,! S DX=5
 F %F=0:0 S FO=$O(^RQSGLU("QMDA","FORM",FO)) Q:(FO="")!(NOL>18)  W ?DX,FO S DX=DX+6 W ?DX,^RQSGLU("QMDA","FORM",FO) S DX=DX+26 I DX>50 W ! S DX=5,NOL=NOL+1
 Q
 
 
 
 
EX(F) 
 Q $D(^RQSGLU("QMDA","FORM",F))
 
COR(ATR,REP,F) 
 N RES
 I $$ADR^%QZNBN1(F) S RES=$$EX(F) G FIN
 
 S RES=$D(^RQSGLU("QMDA","LIB",F)) I RES=1 S F=^RQSGLU("QMDA","LIB",F)
 
FIN I RES=0 D ^%VZEAVT($$^%QZCHW("Format inexistant")) Q 0
 D PA^%QSGESTI("ATTRIBUT",ATR_"/"_$$NOMLOG^%QSF(REP),"DERNIER.FORMAT.UTILISE",F,$I)
 Q 1
 
AFFI(BA,ATR,VAL) 
 
 N FORM,IND
 
 I '($D(^[QUI]RQSDON("REMATDAT",BA,ATR))) D SETREM(BA,ATR)
 Q:'(^[QUI]RQSDON("REMATDAT",BA,ATR)) VAL
 S IND=ATR_"/"_$$NOMLOG^%QSF(BA)
 Q:$$TYPE^%QSGESPE(IND)'="DATE" VAL
 Q:VAL="" VAL
 S FORM=$$^%QSCALIN("ATTRIBUT",IND,"DERNIER.FORMAT.UTILISE",$I)
 I FORM="" S FORM=$$^%QSCALVA("ATTRIBUT",IND,"FORMAT") D PA^%QSGESTI("ATTRIBUT",IND,"DERNIER.FORMAT.UTILISE",FORM,$I)
 Q $$^%QMDAFFI(VAL,FORM)
 
 
INTF(BA,ATR,VAL) 
 
 N FORM,IND,RES
 
 I VAL?1N.N1","1N.N1"/"1N.N1","1N.N Q VAL
 S IND=ATR_"/"_$$NOMLOG^%QSF(BA)
 Q:$$TYPE^%QSGESPE(IND)'="DATE" VAL
 S FORM=$$^%QSCALIN("ATTRIBUT",IND,"DERNIER.FORMAT.UTILISE",$I)
 I FORM="" S FORM=$$^%QSCALVA("ATTRIBUT",IND,"FORMAT") D PA^%QSGESTI("ATTRIBUT",IND,"DERNIER.FORMAT.UTILISE",FORM,$I)
 
 S RES=""
 I "SDMJT"[$E(VAL) S RES=$$^%QMDAFIN(VAL) Q:(RES'="")&(RES'=VAL) RES Q:'($$^%QMDASAI(VAL,.RES)) "" Q RES
 S RES=$$^%QMDAINT(VAL,FORM)
 I RES'="" Q:RES'=VAL RES
 I $$^%QMDASAI(VAL,.RES) Q RES
 Q RES
 
 
 
 
INTF2(BA,ATR,VAL) 
 
 N FORM,IND,RES
 
 I VAL?1N.N1","1N.N1"/"1N.N1","1N.N Q VAL
 S IND=ATR_"/"_$$NOMLOG^%QSF(BA)
 Q:$$TYPE^%QSGESPE(IND)'="DATE" VAL
 S FORM=$$^%QSCALIN("ATTRIBUT",IND,"DERNIER.FORMAT.UTILISE",$I)
 I FORM="" S FORM=$$^%QSCALVA("ATTRIBUT",IND,"FORMAT") D PA^%QSGESTI("ATTRIBUT",IND,"DERNIER.FORMAT.UTILISE",FORM,$I)
 
 I "SDMJT"[$E(VAL) S RES=$$^%QMDAFIN(VAL) Q:(RES'="")&(RES'=VAL) RES Q:'($$^%QMDASAI(VAL,.RES)) VAL Q RES
 S RES=$$^%QMDAINT(VAL,FORM)
 I RES'="" Q:RES'=VAL RES
 I $$^%QMDASAI(VAL,.RES) Q:RES'="" RES
 Q VAL
 
 
FINT(BA,ATR,VAL) 
 
 
 
 
 
 
 N IND,FORM,DEF
 S DEF=0 G FORMINS
FINT2(BA,ATR,VAL) 
 
 N IND,FORM,DEF
 S DEF=1
FORMINS 
 S IND=ATR_"/"_$$NOMLOG^%QSF(BA)
 Q:$$TYPE^%QSGESPE(IND)'="DATE" 1
 I VAL="" S:DEF VAL=$H_"/"_$H Q DEF
 
 Q:VAL?1N.N1","1N.N1"/"1N.N1","1N.N 1
 
 S FORM=$$^%QSCALIN("ATTRIBUT",IND,"DERNIER.FORMAT.UTILISE",$I)
 I FORM="" S FORM=$$^%QSCALVA("ATTRIBUT",IND,"FORMAT") D PA^%QSGESTI("ATTRIBUT",IND,"DERNIER.FORMAT.UTILISE",FORM,$I)
 Q $$^%QMDAOKF(FORM,.VAL)
 
 
KILLREM K ^[QUI]RQSDON("REMATDAT") Q
 
SETREM(BA,ATR) 
 N IND S IND=ATR_"/"_$$NOMLOG^%QSF(BA),^[QUI]RQSDON("REMATDAT",BA,ATR)=$$TYPE^%QSGESPE(IND)="DATE" Q
 ;


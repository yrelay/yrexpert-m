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

;%EDCAUSC^INT^1^59547,73868^0
%EDCAUSC(LIEN1,LIEN2,ETI2,ATT,VAR,ORD) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N OO,VAL,AT,%AT,%VA,%OO,ARRET,ATDAT,VAL2,TEMP,TABATT,TYP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S TABATT=$$CONCAS^%QZCHAD(TEMP,"TA")
 S ARRET=0
 I LIEN1="" S BA=BASE,OBJ=OBJET G ITERV
 I $E(LIEN1)="%" S OBJ=$$^%QCAZG("CXT(LIEN1,""OBJET"")"),BA=$$^%QCAZG("CXT(LIEN1,""BASE"")") G ITERV
 I LIEN2="" S BA=$$REPD^%QSGEL2(BASE,LIEN1),OBJ=$$OBJPROX^%QSCALVU(LIEN1,BASE,OBJET) G ITERV
 I $E(LIEN2)="%" S OBJ=$$^%QCAZG("CXT(LIEN2,""OBJET"")"),BA=$$^%QCAZG("CXT(LIEN2,""BASE"")")
 I $E(LIEN2'="%") S BA=$$REPD^%QSGEL2(BASE,LIEN2),OBJ=$$OBJPROX^%QSCALVU(LIEN2,BASE,OBJET)
 Q:(BA="")!(OBJ="")
 S BA=$$REPD^%QSGEL2(BA,LIEN1),OBJ=$$OBJPROX^%QSCALVU(LIEN1,BA,OBJ)
ITERV Q:(BA="")!(OBJ="")
 I '($D(^[QUI]EDMOD(MOD,"ETI",ETI2))) Q
 D POP
 S AT=""
BOUC S ARRET=0
 S AT=$$NXTRIA^%QSTRUC8(BA,OBJ,AT)
 G:AT="" FIN
 S ATDAT=$$TYPE^%QSGESPE(AT_"/"_$$NOMLOG^%QSF(BA))="DATE"
 S ^V($J,"%",ATT,1)=AT
 K @(TABATT)
 D MVG^%QSCALVA(BA,OBJ,AT,TABATT,.TYP)
 S OO=""
BOUC2 S ARRET=0,OO=$O(@TABATT@(OO)) G:OO="" BOUC
 S VAL=@TABATT@(OO)
 S VAL2=$S(ATDAT:$$AFFI^%QMDAUC(BA,AT,VAL),1:VAL)
 S ARRET=0,LIGNE=^[QUI]EDMOD(MOD,"ETI",ETI2) D EXET
 G BOUC2
FIN 
 K @(TEMP)
 D RPOP
 K ^V($J,MODL,BASE,OBJET,ETI2)
 Q
EXET S ^V($J,"%",VAR,1)=VAL2,^V($J,"%",ORD,1)=OO
EXET1 S LIGNE=$O(^[QUI]EDMOD(MOD,"COMP",LIGNE))
 Q:ARRET
 Q:LIGNE=""
 Q:^[QUI]EDMOD(MOD,"COMP",LIGNE)=""
 X ^[QUI]EDMOD(MOD,"COMP",LIGNE)
 G EXET1
 
POP S ADRM(MODL)=ADRM(MODL)+1,ADRM(MODL,ADRM(MODL))=LIGNE Q
 
RPOP S LIGNE=ADRM(MODL,ADRM(MODL))
 K ADRM(MODL,ADRM(MODL))
 S ADRM(MODL)=ADRM(MODL)-1 Q


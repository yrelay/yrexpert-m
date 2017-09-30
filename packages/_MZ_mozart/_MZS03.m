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

;%MZS03^INT^1^59547,73872^0
MOZS03 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MACH Q:RESUL(IC)=""
 S RESUL(IC)=$$GETLBLAN^%VTLBLAN(RESUL(IC))
 I RESUL(IC)="?" G LMACH
 S PARA=RESUL(IC) D ^%QZCHBT S RESUL(IC)=PARA,REFUSE=1
 S TAB(ICC)=PARA D ^%VAFFICH S REFUSE=0
 I PARA="" S REFUSE=0 Q
 S REFUSE='($D(^[QUI]DESMACH($$M^%QAX(RESUL(IC))))) I '(REFUSE) S RM=80 G FIN
ERR D POCLEPA^%VVIDEO S DX=1 X XY S REP=$$CONFIRM^%VZEOUI($$^%QZCHW("Machine inconnue... Persistez-vous ?"))
 D POCLEPA^%VVIDEO
 I (REP=0)!(REP=-1) G END
 I '($$AUTOR^%MZACVOC(WHOIS)) D ^%VZEAVT("acces non autorise") G END
 N TABMACH
 S TABMACH=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GRILMACH")
 K @(TABMACH)
 S @TABMACH@(1)=$$M^%QAX(RESUL(IC))
 S REFUSE=0,NOMTAB=""
 D POINT^%VAPPELG("DESMACH",TABMACH)
 K @(TABMACH)
 S REFUSE='($D(^[QUI]DESMACH($$M^%QAX(RESUL(IC)))))
 G:REFUSE END
FIN S REFUSE=1,CHAMP=RESUL(IC)
 S TAB(ICC)=$J(" ",30) D ^%VAFFICH
 S TAB(ICC)=$$S^%QAX($$M^%QAX(CHAMP)) D ^%VAFFICH S REFUSE=0
 Q
END K REP,NOMTAB Q
 
NUM I RESUL(IC)="" D ^%VZEAVT("Ce champ est obligatoire ..") S REFUSE=1 Q
 I $E(RESUL(IC),1)=0 D ^%VZEAVT("Ce champ ne peut commencer par un zero ..") S REFUSE=1 Q
 
 S REFUSE='($$ENTP^%QZNBN(RESUL(IC))) I REFUSE D ^%VZEAVT("Ce champ doit etre entier et > 0 ...")
 K XX Q
 
POSN 
 N T,F
 S REFUSE='($$POSN^%QZNBN(RESUL(IC)))
 I '(REFUSE) Q
 D ^%VZEAVT("ce champ doit etre numerique et > 0 ...")
 Q
 
LMACH 
 N NON,RES,TYP,Y1
 D INIT I NON D POCLEPA^%VVIDEO S RES="" G TEST2
 D SYN2^%MZLISOB("^[QUI]DESMACH",$S(Y1="":$O(^[QUI]DESMACH(Y1)),1:Y1),.RES,10,2,19) G TEST
 
CTR D ^%MZLISOB("^[QUI]MOZITEM(TYP)",$S(Y1="":$O(^[QUI]MOZITEM(TYP,Y1)),1:Y1),.RES) G TEST
TEST S CTRLF=0 I RES="" S REFUSE=1
 S:'(NON) RESUL(IC)=RES
 D ^%VAFIGRI S RM=80 D ^%VAFISCR
 D:XOP=2 OPC^%MZEDOP(EDCL) Q
TEST2 S:'(NON) TAB(ICC)=RES D ^%VAFFICH S RM=80,REFUSE=1 D:XOP=2 OPC^%MZEDOP(EDCL) Q
 
INIT S DX=20,DY=23 X XY W "Liste a partir de : " S DX=$X,RM=80 D ^%VLEC,POCLEPA^%VVIDEO I CTRLA!CTRLF S NON=1 Q
 S NON=0 Q
 
LEX 
 I $$OKR^%INCOIN("TO") D CHBKPT^%LXUC5,ABR^%LXUC4,FULL^%LXUC4
 Q
 
MOD() 
 I OR(1)=RESUL(1) G MOD2
 K ^[QUI]DESMACH(OR(1),OR(2)) D SX^%QSGESTK("POSTE.DE.TRAVAIL",OR(1))
MOD2 
 D STO^%VCMSCOR,^%VMODGRI
 Q 0
 
SUP() 
 
 
 K @(m("OLDN")) D ^%VZEATT
 K ^[QUI]DESMACH(RESUL(1),RESUL(2)) D SX^%QSGESTK("POSTE.DE.TRAVAIL",RESUL(1))
 
 D POCLEPA^%VVIDEO
 Q 1
 
MAJMACH 
 N RR S RR=""
 D ^%VAUTOST
 Q:ABENDSCR=1
 F I=3:1:^%SCRE("DESMACH") S RR=RR_RESUL(I)_"^"
 S ^[QUI]DESMACH(RESUL(1),RESUL(2))=RR
 Q
 
ITEM(OBJ,TYP,IC) 
 S:'($D(XOP)) XOP=""
 I TYP="OUTIL" D POCLEPA^%VVIDEO,INIT,CLEPAG^%VVIDEO,^%VZCD0($E(TYP,1,40)),SYN2^%MZLISOB("^[QUI]DESOUT",$S(Y1="":$O(^[QUI]DESOUT(Y1)),1:Y1),.RES,15,8,13) G TEST
 D POCLEPA^%VVIDEO,INIT,CLEPAG^%VVIDEO,^%VZCD0($E(TYP,1,40)),CTR
 Q


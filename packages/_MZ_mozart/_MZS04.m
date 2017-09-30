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

;%MZS04^INT^1^59547,73872^0
MOZS04(OBJ,DXP,DYP) 
 
 
 
 
 
 
 
 
 
DEB I OBJ="" S REFUSE=1 Q
 S REFUSE=0,TYP=$S(IC=1:"ACTION",IC=2:"OBJET",IC=3:"MANIERE",1:"OUTIL"),LIMIT=80 G @TYP
SUIT S DX=1,DY=22 X XY W $$^%QZCHW($$MIN^%VMINUSC(TYP)_$S((IC=1)!(IC=3):" inconnue...",1:" inconnu...")) H 1
INSER S DX=1,DY=22 X XY S REP=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous l'inserer ? "),"N")
 I (REP=0)!(REP=-1) S REFUSE=1 G FIN
 
 N GLOOUT
 S GLOOUT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"OUTIL")
 K @(GLOOUT)
 I TYP="OUTIL" S @GLOOUT@(1)=$$M^%QAX(OBJ),REFUSE=0,NOMTAB="" D POINT^%VAPPELG("DESOUT",GLOOUT),OPC^%MZEDOP(EDCL) K @(GLOOUT) S %=3,RM=80 D RF^%MZED,STAT1^%MZWORD S:'($D(^[QUI]DESOUT($$M^%QAX(OBJ)))) REFUSE=1 G FIN
 S ^[QUI]MOZITEM(TYP,OBJ)=""
FIN I (TYP="OUTIL")&('(REFUSE)) D REAFF
 X XY W $J(" ",40) S RM=80 K CONC,DXP,DYP,IC,LIMIT,OBJ,POS,REP
 Q
ITEM(CONC) 
 S OBJ=$P(CONC,"^",1),IC=$P(CONC,"^",2),DXP=$P(CONC,"^",3),DYP=$P(CONC,"^",4) G DEB
ACTION 
 D ACT
 G:'(REFUSE) SUIT
 Q
ACT 
 I RESUL(IC)="" D ^%VZEAVT("Ce champ est obligatoire ...") S REFUSE=1 Q
 I $D(^[QUI]MOZITEM(TYP,OBJ)) S RM=80 Q
 I OBJ["@" D ^%VZEAVT($$^%QZCHW("Une action ne doit pas contenir de ""@"" ...[RETURN]")) S REFUSE=1 Q
 I OBJ["/" D ^%VZEAVT($$^%QZCHW("Une action ne doit pas contenir de ""/"" ...[RETURN]")) S REFUSE=1 Q
 S REFUSE=0,^[QUI]MOZITEM(TYP,OBJ)="",RM=80 Q  Q
OBJET 
MANIERE 
 I $D(^[QUI]MOZITEM(TYP,OBJ)) S RM=80 Q
 G SUIT
OUTIL 
 I $D(^[QUI]DESOUT($$M^%QAX(OBJ))) D REAFF S RM=80 Q
 G SUIT
REAFF N CHAMP
 S REFUSE=1,CHAMP=RESUL(IC)
 S TAB(ICC)=$J(" ",30) D ^%VAFFICH
 S TAB(ICC)=$$S^%QAX($$M^%QAX(CHAMP)) D ^%VAFFICH S REFUSE=0
 Q


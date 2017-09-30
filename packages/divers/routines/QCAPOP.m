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

;QCAPOP^INT^1^59547,74868^0
%ZPOPA ;
 
 
 
 
 
 
 
 
GEN(RACINE) 
 N GLOB S GLOB="^[QUI]CPTEUR"
 L @(GLOB)
DEB N NUFA D GO
 L
 Q NUFA
GENI(GLOB,RACINE) 
 G DEB
GO N %H1,%H2,%H3,DN,NCT,PN
 D ZD^%QMDATE4 S DN=%DAT
 S NCT=RACINE_$P(DN,"/",3)_$P(DN,"/",2) I '($D(@GLOB@(NCT))) S @GLOB@(NCT)=0
 S PN=@GLOB@(NCT)+1,@GLOB@(NCT)=PN
 S NUFA=$E(NCT,1,7)_$S(PN<10:"000"_PN,PN<100:"00"_PN,PN<1000:"0"_PN,1:PN)
FIN Q
 
GLO(GLOB) 
 N CLE
 S CLE=$ZP(@GLOB@(""))
 Q:CLE="" ""
 Q:'($$ENT^%QZNBN(CLE)) ""
 Q CLE+1
 
GLOB(GLOB) 
 N CLE
 L @(GLOB)
 S CLE=$S($D(@GLOB)#10:@GLOB+1,1:1)
 S @GLOB=CLE
 L
 Q CLE
 
 
 
 
NFONC(PREF,VAR) 
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("    Incrementation de compteur"))
 I $L(PREF)'=3 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("    Le prefixe doit comporter 3 caracteres")) G ERR
 I $E(VAR)'="%" D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("    Une variable temporaire etait attendue")) G ERR
 N VAL
 S VAL=$$GEN(PREF)
 I (MODEX'=1)!((MODAF'=2)&(MODAF'=3)) D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),VAR,VAL,1,"AJOUT") D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR,VAL,1)
 D:MODAF'=0 ADD^%TLIFEN("ATT",VAR_"<--"_VAL)
 Q
ERR 
 S ECHEC=1
 Q
 
 
 
 
 
 
MAJ(NOM) 
 N NOM2,AN,NO,NOM1
 S NOM2=$E(NOM,4,5)
 S NOM1=$E(NOM,1,5)
 
 I NOM2'?.N Q
 S AN=$$AN^%QMDATE1
 
 I AN>NOM2 Q
 S NO2=$E(NOM,6,99)+0
 S NO=$S(($D(^[QUI]CPTEUR(NOM1))#10)=1:^[QUI]CPTEUR(NOM1),1:0)
 
 I (AN=NOM2)&(NO>NO2) Q
 
 S ^[QUI]CPTEUR(NOM2)=NO2
 Q


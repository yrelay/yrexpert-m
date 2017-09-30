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

;%MZIMPGA^INT^1^59547,73872^0
MOZIMPGA(GAM) 
 
 I '($D(^[QUI]MOZGARDE(GAM))) D ^%VSQUEAK,^%VCRIFLD($J("",22),1,21,0,22) S DX=1,DY=21 X XY W $$^%QZCHW("Gamme inexistante ...") S DX=5,DY=22 X XY W $$^%QZCHW("[RETURN] ") R *XX44:^TOZE($I,"ATTENTE") D CLFEN^%VVIDEO(2,21,20,1) Q
 D INIT,CHA,^%MZLSTAR
 I $D(^POSENR($J)) D IMPR
FIN K ^POSENR($J),%ZLG,%ZZZ,CD,CF,DC,GSM,IMPR,LGAF,LILIM,NBPAG,NULI,PAGE,TBV,VAL,XX44,ZLI
 Q
 
INIT S DX=1,DY=21 X XY D NORM^%VVIDEO,^%VCRIFLD($$^%QZCHW("Un instant..."),1,21,0,22)
 S IMPR=^TABIDENT(WHOIS,"PRINTER"),LILIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-15,1:50)
 F %ZZZ="DESIGNATION.PIECE","MATERIEL","OPERATION.PROGRAMME.CONTROLE" S VAL=$$^%QSCALVA($$GI^%MZQS,GAM,%ZZZ),TBV(%ZZZ)=VAL
 Q
 
CHA K ^POSENR($J) S ZLI=100,PAGE=0,NULI=0 F %ZLG=1:1 S NULI=$N(^U($J,0,NULI)) Q:NULI=-1  S LGAF=$P(^U($J,0,NULI),"^",2) D AFFI
 S NBPAG=$S($D(^POSENR($J,PAGE)):PAGE,1:PAGE-1)
 Q
AFFI S CD=1,CF=79
 S LGAF=$TR(LGAF,$C(1)," ")
TL S DC=$E(LGAF,CF) I (DC'=" ")&(DC'="") S CF=CF-1 G TL
 S ZLI=ZLI+1 I ZLI>LILIM S ZLI=1,PAGE=PAGE+1
 S ^POSENR($J,PAGE,ZLI)=$E(LGAF,CD,CF) Q:DC=""  S CD=CF+1,CF=CF+80 G TL
 
IMPR S DX=1,DY=21 X XY D NORM^%VVIDEO,^%VCRIFLD($$^%QZCHW("Impression de "_GAM),1,21,0,22),ZD^%QMDATE4,^%QMDAK0 O IMPR U IMPR
 F PAGE=1:1 Q:'($D(^POSENR($J,PAGE)))  D ENTET,AFFREN,AFF
 W ! C IMPR Q
ENTET H 5 W #,!,"Le : ",%DAT," a : ",HEURE,?26,"*** GAMME DE FABRICATION ***",!,!
 Q
AFFREN S GSM="Page : "_PAGE_"/"_NBPAG W LSTAR,!,"| No de gamme  : ",GAM,?40,"OPC",?52,": ",$E(TBV("OPERATION.PROGRAMME.CONTROLE"),1,37),?79,"|",!,"| Designation  : ",$E(TBV("DESIGNATION.PIECE"),1,37),?40,"Materiel",?52,": ",$E(TBV("MATERIEL"),1,37)
 W ?79,"|",!,"|",?40-($L(GSM)\2),GSM,?79,"|",!,LSTAR,!
 Q
AFF F %ZLG=1:1 Q:'($D(^POSENR($J,PAGE,%ZLG)))  W !,^POSENR($J,PAGE,%ZLG)
 Q


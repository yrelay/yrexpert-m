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

;%LXSCOR^INT^1^59547,73871^0
%LXSCOR ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N COMM,TEMP,REP
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("MESURE DE LA QUALITE DU LEXIQUE"))
 D NEW^%LXMAJ
 D MSG^%VZEATT($$^%QZCHW("Evaluation de la qualite du lexique en cours ..."))
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S COMM=$$CONCAS^%QZCHAD(TEMP,"COMM")
 S (RN,RC,RE,RA,RAT)=0
 S STOP=0 D NBMOT(.RN) G:RN=-1 END G:STOP=1 END
 D COMM^%LXSCO2(.RC,.STOP,COMM) G:STOP=1 END
 D MALECR^%LXSCO2(.RE,.STOP,TEMP) G:STOP=1 END
 D AMBIG^%LXSCO2(.RA,.STOP,TEMP) G:STOP=1 END
 D ATTRIBUT^%LXATTR(.RAT,.STOP,TEMP) G:STOP=1 END
 S VRES=0
 D RAPPRO^%LXRAP
TEST D AFFI
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 I UC="VAX" S MEN="MEN1"
 I UC'="VAX" S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 D MENU(MEN)
DIAL D ^%VQUIKMN(0,80,22,MEN,.AD,.CONTR) G:(CONTR="A")!(CONTR="F") END
 I AD'="" G @AD
 G DIAL
COMM D AFF(COMM),AFFI G DIAL
AMBIG D AFF(AMBIG),AFFI G DIAL
ECRIT D AFF(MALECR),AFFI G DIAL
ATTRI D AFF(ATTRIB),AFFI G DIAL
NEMP D INUSIT^%LXRAP,AFFI G DIAL
NETTOIE D ^%LXNET,AFFI G DIAL
END K @(TEMP) Q
 
 
 
 
NBMOT(RN) 
 N NB
 I '($D(^[QUI]TOLEX)) D ^%VZEAVT($$^%QZCHW("Attention le lexique est vide !!!")) S RN=-1 Q
 S NB=^[QUI]TOLEX-$S('($D(^[QUI]ZSYSMORE)):0,1:^[QUI]ZSYSMORE)
 S NB=NB-200 I NB<0 S RN=0 Q
 S RN=NB\50 Q
 
MENU(MEN) 
 S @MEN="21^10^79"
 S @MEN@(1)=$$^%QZCHW("Non commente")_"^COMM"
 S @MEN@(1,"COM")=$$^%QZCHW("Mots non commentes")
 S @MEN@(2)=$$^%QZCHW("Mal ecrit")_"^ECRIT"
 S @MEN@(2,"COM")=$$^%QZCHW("Mots mal ecrits")
 S @MEN@(3)=$$^%QZCHW("Imbrique")_"^AMBIG"
 S @MEN@(3,"COM")=$$^%QZCHW("Mots imbriques")
 S @MEN@(4)=$$^%QZCHW("Lexique")_"^ACLEX"
 S @MEN@(4,"COM")=$$^%QZCHW("Acces au lexique")
 S @MEN@(5)=$$^%QZCHW("Attributs non repertories")_"^ATTRI"
 S @MEN@(5,"COM")=$$^%QZCHW("Attributs absents du lexique")
 S @MEN@(6)=$$^%QZCHW("Mots non employes")_"^NEMP"
 S @MEN@(6,"COM")=$$^%QZCHW("Mots non employes dans les repertoires et dans TOTEM")
 S @MEN@(7)=$$^%QZCHW("Nettoyage")_"^NETTOIE"
 S @MEN@(7,"COM")=$$^%QZCHW("Suppression automatique des mots non employes et non commentes")
 Q
 
ACLEX 
 N REP
 D POCLEPA^%VVIDEO W $$^%QZCHW(" (L)exique/(C)onsultation breve/[RETURN] ") R *REP:^TOZE($I,"ATTENTE") S:REP=-1 REP=13
 S REP=$C(REP) D:REP=$$^%QZCHW("C") ^%LXCONS D:REP=$$^%QZCHW("L") CLEPAG^%VVIDEO,^%VCMS("LEXIQUE")
 D AFFI G DIAL
 
 
AFF(GLO) 
 
 Q:$O(@GLO@(""))=""
 D CLEPAG^%VVIDEO,INIT^%QUCHOIP(GLO,1,"",10,2,40,20),AFF^%QUCHOIP
 S X=$$UN^%QUCHOIP D END^%QUCHOIP Q
 
AFFI D CLEPAG^%VVIDEO,CARSA^%VVIDEO(4,0,75,4)
 S DX=25,DY=2 X XY D BLD^%VVIDEO W $$^%QZCHW("MESURE DE LA QUALITE DU LEXIQUE") D NORM^%VVIDEO
 S RAP=^[QUI]LXRAP("RES","NEMP")
 S NBTOT=^[QUI]TOLEX-^[QUI]ZSYSMORE
 S R1=((RN/400)+((((RE+RA)+RC)+RAT)+RAP))/1500,R2=20*(1-R1)
 S:R2<0 R2=0
 S R2=$J(R2,2,1)
 D BLD^%VVIDEO,^%VZCD(5,34,4,8,1,0,"SCORE : "_R2_" / 20"),NORM^%VVIDEO
 D CARSA^%VVIDEO(11,9,59,3) S DX=13,DY=10 X XY W "Score = 20 x {1 - [RN/400+(NME+NI+NNC+NATT+NEMP)/1500]}"
 D CARSA^%VVIDEO(3,12,35,3) S DX=5,DY=13 X XY W $$^%QZCHW("Mots au lexique (NT): ")_(^[QUI]TOLEX-^[QUI]ZSYSMORE)
 D CARSA^%VVIDEO(42,12,35,3) S DX=44,DY=13 X XY W $$^%QZCHW("Mots non commentes (NNC): ")_RC
 D CARSA^%VVIDEO(3,15,35,3) S DX=5,DY=16 X XY W $$^%QZCHW("Mots mal ecrits (NME): ")_RE
SUIT D CARSA^%VVIDEO(42,15,35,3) S DX=44,DY=16 X XY W $$^%QZCHW("Mots imbriques (NI): ")_RA
SUIT2 D CARSA^%VVIDEO(3,18,35,3) S DX=5,DY=19 X XY W $$^%QZCHW("Attributs absents (NATT): ")_RAT
SUIT3 D CARSA^%VVIDEO(42,18,35,3) S DX=44,DY=19 X XY W $$^%QZCHW("Mots non employes (NEMP): ")_RAP
 Q


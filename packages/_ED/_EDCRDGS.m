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

;%EDCRDGS^INT^1^59547,73869^0
%EDCRDGS ;;09:57 AM  8 Feb 1993; ; 08 Feb 93  9:57 AM
 
 
 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK,SOR,REP
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 D INIT
 
 S (VALDEF(2),VALDEF(4))=""
 S VALDEF(1)=$S($D(^ENVCONF("RD-GL2","TABLE")):^ENVCONF("RD-GL2","TABLE"),1:"A2")
 S VALDEF(3)=$S($D(^ENVCONF("RD-GL2")):$P(^ENVCONF("RD-GL2"),"^"),1:"A2")
 S VALDEF(5)=$S($D(^ENVCONF("RD-GL2","MODE")):^ENVCONF("RD-GL2","MODE"),1:"A")
 S VALDEF="STOCK"
DEF 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK))
 S SOR=$P(STOCK,$C(0),1) S:SOR'="" ^ENVCONF("RD-GL2","TABLE")=SOR
 S SOR=$P(STOCK,$C(0),3) S:SOR'="" $P(^ENVCONF("RD-GL2"),"^")=SOR
 S SOR=$P(STOCK,$C(0),5) S:SOR'="" ^ENVCONF("RD-GL2","MODE")=SOR
 K STOCK,@(GLO)
 Q
 
INIT 
 N NBC,I,J,OBLIG,TJSOK,PLL
 
 S NBC=5
 
 
 
 
 
 
 S @GLO@("FL")="LDR"
 
 S @GLO=$$^%QZCHW("caracteristiques de la table tracante")
 
 S @GLO@("H")=2,@GLO@("V")=6
 
 S @GLO@("NBC")=NBC
 
 S @GLO@("CHAMPS",1)=$$^%QZCHW("Taille de la table tracante")
 S @GLO@("CHAMPS",2)=""
 S @GLO@("CHAMPS",3)=$$^%QZCHW("Format des feuilles utilisees")
 S @GLO@("CHAMPS",4)=""
 S @GLO@("CHAMPS",5)=$$^%QZCHW("Mode d'adressage (Agrandissement ou Reel)")
 
 S PLL=0 F I=1:1:NBC I $L(@GLO@("CHAMPS",I))>PLL S PLL=$L(@GLO@("CHAMPS",I))
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=5 F I=1:1:NBC S @GLO@("LARG",I)=5
 
 S @GLO@("SUIV",1)=3,@GLO@("PREC",1)=5
 S @GLO@("SUIV",3)=5,@GLO@("PREC",3)=1
 S @GLO@("SUIV",5)=1,@GLO@("PREC",5)=3
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 S @GLO@("AIDE",1)="format des plus grandes feuilles"_$C(0)_"que l'on peut mettre"_$C(0)_"sur la table tracante"_$C(0)_"(par exemple A2 pour un table ROLAND DG L2)"
 S @GLO@("AIDE",3)="exemple A4,A3, .. "
 S @GLO@("AIDE",5)="A : agrandissement"_$C(0)_"  les modeles et formats de GDX adressent une feuille A4"_$C(0)_"  les coordonnes seront multipliees par le systeme"_$C(0)_"  pour ecrire sur toute la page"
 S @GLO@("AIDE",5)=@GLO@("AIDE",5)_$C(0)_"R : reel"_$C(0)_"  les modeles et formats utilisent directement la totalite de la page"
 
 
 
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 S @GLO@("UCONT.CHAMPS",1)="D OK1^%EDCRDGS"
 S @GLO@("UCONT.CHAMPS",3)="D OK3^%EDCRDGS"
 S @GLO@("UCONT.CHAMPS",5)="D OK5^%EDCRDGS"
 S @GLO@("UCONT")=""
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=OBLIG
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=TJSOK
 Q
 
 
 
OK1 N TO,FMT,II,%II,IR,SAVR,TABUTI
 F FMT="A0","A1","A2" S TABUTI(FMT)=""
 S SAVR=%R
 I $$GETLBLAN^%VTLBLAN(X)="?" S X=$$UN^%PKCHOIX("TABUTI",10,12,8),REUC=1
 G:X="" ROK
 I '($D(TABUTI(X))) D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Format non valide")_"*",0) S %R=SAVR-1 D PARAM^%PKPOP(.Y) G RNOK
ROK S %R=SAVR,OK=1 Q
RNOK S %R=SAVR,OK=0 Q
 Q
 
 
OK3 N TO,FMT,II,%II,IR,SAVR,TABUTI
 F FMT="A0","A1","A2","A3","A4" S TABUTI(FMT)=""
 S SAVR=%R
 I $$GETLBLAN^%VTLBLAN(X)="?" S X=$$UN^%PKCHOIX("TABUTI",10,12,8),REUC=1
 G:X="" ROK
 I '($D(TABUTI(X))) D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Format non valide")_"*",0) S %R=SAVR-1 D PARAM^%PKPOP(.Y) G RNOK
 G ROK
 
 
OK5 N TO,FMT,II,%II,IR,SAVR,TABUTI
 S TABUTI("Agrandissement")="",TABUTI("Reel")=""
 S SAVR=%R
 I $$GETLBLAN^%VTLBLAN(X)="?" S X=$$UN^%PKCHOIX("TABUTI",10,12,8),REUC=1
 G:X="" ROK
 S IR=$E(X)
 I (IR'="A")&(IR'="R") D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Mode non valide")_"*",0) S %R=SAVR-1 D PARAM^%PKPOP(.Y) G RNOK
 G ROK
 ;


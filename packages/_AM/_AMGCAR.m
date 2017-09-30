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

;%AMGCAR^INT^1^59547,73865^0
%AMGCAR ;
 
 
 
 
 
 
 
CARACOUR 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK,SOR
 D CURON^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 S NBC=3
 D INIT
 
 W /WOPEN(1,1,78,21,"","","","","tc")
 
 S VALDEF(1)=$S($D(profondeur):profondeur,1:"OUI")
 S VALDEF(2)=""
 S VALDEF(3)=$S($D(TIMEWAIT):TIMEWAIT,1:1)
 S VALDEF="STOCK"
DEF 
 
 S ^TEST2=$$getall^%mixinterp
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 U $I:(IXXLATE=1)
 
 
 D CUROF^%VVIDEO
 W /WCLOSE
 I '($D(STOCK)) Q
 S profondeur=$P(STOCK,$C(0))
 S TIMEWAIT=$P(STOCK,$C(0),3)
 K STOCK,@(GLO)
 Q
 
INIT 
 N I,J,OBLIG,TJSOK,PLL
 
 
 
 
 
 
 
 S @GLO@("FL")="LDR"
 
 S @GLO="caracteristiques de l'explication"
 
 S @GLO@("H")=10,@GLO@("V")=5
 
 S @GLO@("NBC")=NBC
 
 S @GLO@("CHAMPS",1)="exploration des etudes filles       :"
 S @GLO@("CHAMPS",2)=" "
 S @GLO@("CHAMPS",3)="temps d'attente sur les deroulements :"
 
 S PLL=0 F I=1:1:NBC I $L(@GLO@("CHAMPS",I))>PLL S PLL=$L(@GLO@("CHAMPS",I))
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=8 F I=1:1:NBC S @GLO@("LARG",I)=8
 
 F I=1:1:2 S @GLO@("SUIV",(2*I)-1)=(2*I)+1,@GLO@("PREC",(2*I)+1)=(2*I)-1
 S @GLO@("SUIV",(2*I)-1)=1,@GLO@("PREC",1)=(2*I)-1
SUITE 
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 S @GLO@("AIDE",1)="lors des recherches, des affichages de"_$C(0)_"deroulement de l'execution, "_$C(0)_" faut-il parcourir les etudes filles ? "_$C(0)_"(repondre OUI ou NON)"
 S @GLO@("AIDE",3)="nombre de secondes durant lequel"_$C(0)_"les ecrans doivent rester affiches"_$C(0)_"lors des actions tracer et visualiser "
 S TJSOK="S OK=1"
 S OBLIG="S OK=(VAL'="""")"
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 S @GLO@("UCONT.CHAMPS",1)="D OKPROF^%AMGCAR"
 F I=2:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 S @GLO@("UCONT")=""
 
 F I=1:2:NBC S @GLO@("OBLIGAT",I)=OBLIG
 S @GLO@("OBLIGAT",2)=TJSOK
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=TJSOK
 Q
 
OKPROF 
 N TO,II,%II,IR,SAVR,TABUTI
 S SAVR=%R,TABUTI=$$TEMP^%SGUTIL
 I $$GETLBLAN^%VTLBLAN(X)="?" S @TABUTI@("OUI")="",@TABUTI@("NON")="",X=$$UN^%PKCHOIX(TABUTI,10,12,8),REUC=1
 G:X="" ROK
 I (X'="OUI")&(X'="NON") D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("OUI ou NON attendu")_"*",0) S %R=SAVR-1 D PARAM^%PKPOP(.Y) G RNOK
ROK S %R=SAVR,OK=1 K @(TABUTI) Q
RNOK S %R=SAVR,OK=0 K @(TABUTI) Q
 Q
 ;


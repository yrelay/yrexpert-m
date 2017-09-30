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

;%TXOPTSW1^INT^1^59547,74032^0
%TXOPTSW1 ;
 
 N NBC,v,i,GLO,GSUIV,VAL,VALCON,NBFIX
 S STO="STOCON",VAL="VALCON",NBC=12
 S NBC=NBC+1,NBFIX=1 ;;le nom de l'etude est un parametre
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"1")
 S GSUIV="^[QUI]etu(ETUDE)"
 
 D INICONF
 S ABAND="N" D INIT
 
 S J=1 F i=1:1:NBC S VALCON(J)=@GSUIV@(VAR(i)),J=J+1
DEF 
 S VALCON="STOCON"
 K STOCON
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 I '($D(STOCON)) S ABAND="O"
 Q:'($D(STOCON))
 
 S J=1 F i=1:1:NBC S @GSUIV@(VAR(i))=$P(STOCON,$C(0),J),J=J+1
 K STOCON
 
 K @(GLO) Q
 
INIT 
 N I,J,OBLIG,TJSOK
 
 
 
 
 
 
 
 S @GLO@("FL")="LDR"
 
 S @GLO=$P($T(TITRE+1),";;",2)
 
 S @GLO@("H")=10,@GLO@("V")=6
 
 S @GLO@("NBC")=NBC
 
 S (%pll,%PLL,J)=0 F i=1:1:NBC S I=VAR(i),J=J+1,@GLO@("CHAMPS",J)=I,%pll=$L(I) I %pll>%PLL S %PLL=%pll
 
 S @GLO@("PLL")=%PLL
 
 S @GLO@("L")=20
 F I=1:1:NBC S @GLO@("LARG",I)=20
 
 F I=2:1:NBC-3 S J=(I#NBC)+1,@GLO@("SUIV",I)=J,@GLO@("PREC",J)=I
 S @GLO@("SUIV",NBC-3)=1+NBFIX,@GLO@("PREC",1+NBFIX)=NBC-3
 
 
 
 
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
hlp F I=1:1:NBC S @GLO@("AIDE",I)="Non defini"
 ;;S @GLO@("AIDE",1)="Veuillez saisir le code alliage"_$c(0)_"correspondant a l'alliage"_$c(0)_"? pour visualiser les valeurs"_$c(0)_"possible pour le champs 1"
 
 
 
 S TJSOK=$XECUTE("S OK=1")
 S OBLIG=$XECUTE("S OK=(VAL'="""")")
 
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)="S OK=$$OKCHA^%TXOPTSW1"
 S @GLO@("UCONT")="S OK=$$OKSAI^%TXOPTSW1"
 
 
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=TJSOK
 
 Q
OKON() ;; test OUI NON
 I ((VAL="oui")!(VAL="O"))!(VAL="o") S %R=%RI,(VAL,X,VAL(I),Y(I+NBC))="OUI" D PARAM^%PKPOP(.Y) S %R=%RI Q 1
 I ((VAL="non")!(VAL="n"))!(VAL="N") S %R=%RI,(VAL,X,VAL(I),Y(I+NBC))="NON" D PARAM^%PKPOP(.Y) S %R=%RI Q 1
 Q:(VAL="OUI")!(VAL="NON") 1
 Q 0
OKSAI() 
 
 Q 1
OKCHA() 
 Q X'=""
 Q 0
INICONF 
 
 D INIVAR
 Q
INIVAR 
 F i=1:1:NBC S v=$P($T(VAR+i),";;",2),v1=$P(v,"~",1),v2=$P(v,"~",2),VAR(i)=v1 S:v2["$$" @("v2="_v2) S:'($D(@GSUIV@(VAR(i)))) @GSUIV@(VAR(i))=v2
 Q
etude() Q ETUDE
VAR 
 ;;Etude~$$etude
 ;;Entreprise~YXP
 ;;Projet~Mise au Point
 ;;Commentaire~Tests generaux TXP1
 ;;Date de Creation~$$DATEX^%QMDATE($h)
 ;;Date de Derniere Mise a Jour~$$DATEX^%QMDATE($h)
 ;;Nombre de Periodes~23
 ;;Periodes exprimees en~SEMAINES
 ;;Date de Depart~$$DATEX^%QMDATE($h)
 ;;Hypothese de Production~Couvrir la periode suivante
 ;;     ~     
 ;;Etat de l'etude~Non encore activee
 ;;Valeur~3000000000 
 
TITRE ;;
 ;;Description de l'Etude
 
INIV(NBC,GSUIV) 
 
 F i=1:1:NBC S v=$P($T(VAR+i),";;",2),v1=$P(v,"~",1),v2=$P(v,"~",2),VAR(i)=v1 S:v2["$$" @("v2="_v2) S:'($D(@GSUIV@(VAR(i)))) @GSUIV@(VAR(i))=v2
 Q


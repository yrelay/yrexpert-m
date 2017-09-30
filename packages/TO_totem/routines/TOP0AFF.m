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

;TOP0AFF^INT^1^59547,74873^0
ZGLOAFF ;
 
 K ^ROUAFF($J),^GLAFF($J) S CHA="ZL @%PGM S NULI=0,OETIC="""" X EXE",EXE="F %U=2:1 Q:$T(+%U)=""""  S LG=$T(+%U) X STO"
 S STO="S ETIC=$P(LG,"" "",1) S:ETIC'="""" OETIC=ETIC,NULI=0,INS=$P(LG,ETIC,2),INS=$E(INS,2,$L(INS))  S:ETIC="""" ETIC=OETIC,INS=$E(LG,2,$L(LG)) S NULI=NULI+1,^ROUAFF($J,%PGM,ETIC,NULI)=INS"
 X CHA S NULI=-1 F %II=1:1 S NULI=$N(^ROUAFF($J,%PGM,"PARAM",NULI)) Q:NULI=-1  D TRAIT
FIN K ^ROUAFF($J),CHA,EXE,STO,%PGM,NULI,ETIC,LG,OETIC,%U,INS,%II,%JJ,%KK,LIGNE,%TAB,PAR,PAGE,LG,LNGR,COL,NBLG,JUST,POL,TYPAF,LP,%PCH,LI,V1,V2
 Q
TRAIT S LIGNE=^ROUAFF($J,%PGM,"PARAM",NULI) Q:LIGNE=""
 S LIGNE=$P(LIGNE,";;",2),TYPA=$P(LIGNE,"~",8),TYPAR=$S(TYPA="":"P",TYPA="P":TYPA,TYPA="C":TYPA,1:"C")
 S %TAB=$P(LIGNE,"~",10),PAR=$P(LIGNE,"~",9),PAGE=$P(LIGNE,"~",1),LG=$P(LIGNE,"~",2),COL=$P(LIGNE,"~",3),LNGR=$P(LIGNE,"~",4),NBLG=$P(LIGNE,"~",5),JUST=$P(LIGNE,"~",6),POL=$P(LIGNE,"~",7)
 S TYPAF="" G:POL="" SUITR
 S LP=-1 F %KK=1:1 S LP=$N(^ROUAFF($J,%PGM,POL,LP)) Q:LP=-1  I %KK'=1 S TYPAF=$P(^ROUAFF($J,%PGM,POL,LP),";;",2)_"|"
SUITR S %PCH=PAR I TYPAR="P" Q:'($D(@%TAB@(PAR)))  S %PCH=@%TAB@(PAR) S:%PCH="inconnu" %PCH=""
 D ^%QZNBN1 I ISNUM&(JUST'="N") S JU=$S(JUST="":2,1:JUST),%PCH=$J(%PCH,1,JU),^GLAFF($J,PAGE,LG,COL)=$E(%PCH,1,LNGR)_"|"_TYPAF G FINTR
 S V1=%PCH,LI=LG F %JJ=1:1:NBLG-1 Q:LNGR>$L(V1)  S V2=$E(V1,1,LNGR),V1=$E(V1,LNGR+1,$L(V1)),^GLAFF($J,PAGE,LI,COL)=V2_"|"_TYPAF,LI=LI+1
 S ^GLAFF($J,PAGE,LI,COL)=$E(V1,1,LNGR)_"|"_TYPAF G FINTR
FINTR Q


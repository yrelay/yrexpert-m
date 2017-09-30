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
;! HL002 ! HL     ! 19/08/12 ! Global variable undefined                      !
;! HL003 ! HL     ! 19/08/12 ! $XECUTE(VAL) la fonction n'existe pas          !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TLOCMP^INT^1^59547,74030^0
%TLOCMP ;;10:13 AM  9 Aug 1993; ; 09 Aug 93 10:11 AM
 
ALL N TRT,ITRT,LIST
 S LIST="^[QUI]TTL"
 G COMPL
PART(LIST) 
 N TRT,ITRT
COMPL D CLEPAG^%VVIDEO
 S TRT="" F ITRT=0:0 S TRT=$O(@LIST@(TRT)) Q:TRT=""  W !,TRT,"  ",$S($$COMPTRT(TRT,0):"ok",1:"probleme")
 Q
 
 
 
 
COMPTRT(TRT,VISER) 
 N GLOTTL,GLOCOMP,RES
 S GLOTTL="^[QUI]TTL("""_TRT_""",2)"
 S GLOCOMP="^[QUI]RQSDON(""COMPTRT"","""_TRT_""")"
 S RES=$$COMPELEM(GLOTTL,GLOCOMP,VISER)
 Q RES
 
 
 
COMPELEM(GLOLIG,GLOCOMP,VISER) 
 N LIG,TETE,ICCOUR,OKCOMPI,IELCAL,ALLOK,PILE,TSTDVT
 K ^MESURE($J)
 S TSTDVT=0
 S PILE=$$TEMP^%SGUTIL,@PILE=0
 S $ZT="ERRCOMP^%TLOCMP"
 K @(GLOCOMP)
 I TSTDVT S (ICCOUR,IELCAL)=0 K ^TEST
 S LIG=""
NXLIG S LIG=$O(@GLOLIG@(LIG)) I LIG="" K @(PILE) Q 1
 I VISER W !,LIG,!," ",@GLOLIG@(LIG)
 ;HL002 S TETE=@GLOLIG@(LIG,"TETE")
 S:$D(@GLOLIG@(LIG,"TETE")) TETE=@GLOLIG@(LIG,"TETE")
 S:'(TSTDVT) (ICCOUR,IELCAL)=0
 S OKCOMPI=1
 D COMPIL(1,TETE)
 I '(OKCOMPI) K @(GLOCOMP),@(PILE) Q 0
 I IELCAL>0 D RESOL
 
 G NXLIG
RESOL N IE,%IE,%F,VAL
 S IE="" F %IE=0:0 S IE=$O(@GLOCOMP@(LIG,IE)) Q:IE=""  F %F=0:0 S VAL=@GLOCOMP@(LIG,IE) Q:'($F(VAL,$C(179)))  S @GLOCOMP@(LIG,IE)=$P(VAL,$C(179))_IELCAL($P(VAL,$C(179),2))_$P(VAL,$C(179),3,9999)
 Q
ZXEC N IE,%IE,%F,VAL
 ;HL003 S IE="" F %IE=0:0 S IE=$O(@GLOCOMP@(LIG,IE)) Q:IE=""  S VAL=@GLOCOMP@(LIG,IE),@GLOCOMP@(LIG,IE)=$XECUTE(VAL)
 S IE="" F %IE=0:0 S IE=$O(@GLOCOMP@(LIG,IE)) Q:IE=""  S VAL=@GLOCOMP@(LIG,IE)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
COMPIL(I,X) 
 N ICOMP,ZZZ
 Q:'(OKCOMPI)
 S $ZT="ERRCOMP"
 G:'($D(^[QUI]ANSA(X,"TEXTE"))) CMPI2
 G:^[QUI]ANSA(X,"TEXTE")="" CMPI2
 G:'($$ISVBSTD(^[QUI]ANSA(X,"TYPE"),^[QUI]ANSA(X,"TEXTE"))) CMPI1
 
 
 S ICOMP=1
CMPI0 I '($D(^%COMPIL($$TYPSTD(^[QUI]ANSA(X,"TYPE"),^[QUI]ANSA(X,"TEXTE")),ICOMP))) S $ZT="" Q
 X ^%COMPIL($$TYPSTD(^[QUI]ANSA(X,"TYPE"),^[QUI]ANSA(X,"TEXTE")),ICOMP)
 S ICOMP=ICOMP+1
 G CMPI0
CMPI1 G:'($D(^%COMPIL("C1",^[QUI]ANSA(X,"TYPE")))) CMPI2
 G:'($D(^%COMPIL("C1",^[QUI]ANSA(X,"TYPE"),^[QUI]ANSA(X,"TEXTE")))) CMPI2
 F ICOMP=1:1 Q:'($D(^%COMPIL("C1",^[QUI]ANSA(X,"TYPE"),^[QUI]ANSA(X,"TEXTE"),ICOMP)))  X ^%COMPIL("C1",^[QUI]ANSA(X,"TYPE"),^[QUI]ANSA(X,"TEXTE"),ICOMP)
 S $ZT="" Q
CMPI2 I '($D(^%COMPIL("C",^[QUI]ANSA(X,"TYPE")))) G CMPIERR
 F ICOMP=1:1 Q:'($D(^%COMPIL("C",^[QUI]ANSA(X,"TYPE"),ICOMP)))  X ^%COMPIL("C",^[QUI]ANSA(X,"TYPE"),ICOMP)
 S $ZT="" Q
ERRCOMP S ERR=$ZE,$ZT=""
 I VISER W !,"probleme sur la compilation d'expression",!,ERR,!,"noeud   ",^[QUI]ANSA(X,"TYPE") I $D(^[QUI]ANSA(X,"TEXTE")) W "  ",^[QUI]ANSA(X,"TEXTE")
 Q 0
 
 
 
 
 
 
 
 
 
 
 
 
COMPADR(I,X) 
 N ICOMP,ZZZ Q:'(OKCOMPI)
 I '($D(^%COMPIL("A",^[QUI]ANSA(X,"TYPE")))) G CMPIERR
 S $ZT="ERRCOMP2"
 F ICOMP=1:1 Q:'($D(^%COMPIL("A",^[QUI]ANSA(X,"TYPE"),ICOMP)))  X ^%COMPIL("A",^[QUI]ANSA(X,"TYPE"),ICOMP) Q
 S $ZT="" Q
ERRCOMP2 S ERR=$ZE,$ZT=""
 I VISER W !,"probleme sur la compilation d'adresse",!,ERR,!,"noeud   ",^[QUI]ANSA(X,"TYPE") I $D(^[QUI]ANSA(X,"TEXTE")) W "  ",^[QUI]ANSA(X,"TEXTE")
 Q 0
 
 
 
 
 
 
COMPCHEM(I,X) Q:'(OKCOMPI)
 N ICOMP,ZZZ
 S $ZT="ERRCOMP3"
 I '($D(^%COMPIL("H",^[QUI]ANSA(X,"TYPE")))) G CMPIERR
 F ICOMP=1:1 Q:'($D(^%COMPIL("H",^[QUI]ANSA(X,"TYPE"),ICOMP)))  X ^%COMPIL("H",^[QUI]ANSA(X,"TYPE"),ICOMP)
 S $ZT=""
 Q
ERRCOMP3 S ERR=$ZE,$ZT=""
 Q:'(VISER) 0
 W !,"probleme sur la compilation de chemin",!,ERR
 W !,"noeud   ",^[QUI]ANSA(X,"TYPE")
 I $D(^[QUI]ANSA(X,"TEXTE")) W "  ",^[QUI]ANSA(X,"TEXTE")
 Q 0
 
 
CMPIERR S $ZT=""
 I VISER W !,"noeud inconnu : ",^[QUI]ANSA(X,"TYPE") I $D(^[QUI]ANSA(X,"TEXTE")) W "  ",^[QUI]ANSA(X,"TEXTE")
 S OKCOMPI=0
 Q
 
 
 
PUSH(ICC) S @PILE=@PILE+1,@PILE@(@PILE)=ICC Q
PULL() N V S V=@PILE@(@PILE),@PILE=@PILE-1 Q V
 
 
 
INSER(PH) 
 I TSTDVT S ICCOUR=ICCOUR+1,^TEST("R",ICCOUR)=PH Q
 S ICCOUR=ICCOUR+1,@GLOCOMP@(LIG,ICCOUR)=PH Q
 
 
 
ADROUT(VERBE) 
 
 Q ^%RQSGLO("MOTEUR","TRT","VERBE",VERBE,"ADRESSE.DE.LA.ROUTINE",1)
 
 
ISVBSTD(TYPE,TEXTE) 
 N VAL
 I ((TYPE'="ACTION")&(TYPE'="FONCTION"))&(TYPE'="FONCTION.LOGIQUE") Q 0
 
 
 I '($D(^%RQSGLO("MOTEUR","TRT","VERBE",TEXTE))) Q 0
 I '($D(^%RQSGLO("MOTEUR","TRT","VERBE",TEXTE,"FORME.GENERIQUE"))) Q 0
 Q 1
 
 
TYPSTD(ACTFONC,VERBE) 
 
 Q ^%RQSGLO("MOTEUR","TRT","VERBE",VERBE,"FORME.GENERIQUE",1)
 
 
TYPPAR(VERBE,NUMPAR) 
 N N
 S N=NUMPAR
TYPPS Q:N=0 "EXPR"
 
 I $D(^%RQSGLO("MOTEUR","TRT","VERBE",VERBE,"NATURE.PARAMETRE",N)) Q ^%RQSGLO("MOTEUR","TRT","VERBE",VERBE,"NATURE.PARAMETRE",N)
 S N=N-1 G TYPPS


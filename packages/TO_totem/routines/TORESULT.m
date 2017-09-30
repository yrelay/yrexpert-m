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

;TORESULT^INT^1^59547,74875^0
TORESULT ;
 
 K ^AFFPAG($I) D CLEPAG^%VVIDEO,^%AB3STAR S DXG=0,DXD=39,DYH=0,DYB=4,MSG="Resultat",GRAPH=1 D TO4^%VZCD
 I '($D(^EQUIVAL($I))) D POCLEPA^%VVIDEO W "Pas de solutions admissibles ! [RETURN] " R *RET G FIN
LECSUP S DX=0,DY=12 D CLEBAS^%VVIDEO W $$L19^%QSLIB1 R *SUP D TOUCHE^%INCCLAV(SUP,.SUP)
 G:(SUP=1)!(SUP=6) FIN
 S SUP=$C(SUP) G:(SUP'="E")&(SUP'="I") LECSUP D @SUP G FIN
FIN K AFFPAG($I),LOSTAR,LSTAR,%DAT,HEURE,SUP,IMPR,EGAP,LI,PAGE,TITRE,%CH,%LGR,NBD,NUEQ,RCD,RFC,TBR,TBF,NRO,%NNN,%ORN,%U,RCT,ITC,LDEN,%DDEP,LIGNE,REF,PLDIS,LILIM,%III Q
E S EGAP=0,LI=21,LILIM=21 D TR1,^TOPAGIN Q
TR1 S TITRE="| Denomination TOTEM",%CH=" | Reference    ",%LGR=42 D ^%QZCHBK S TITRE=TITRE_%CH_"|   Cout    | Nb |"
 S NBD=-1 F %NNN=1:1 S NBD=$N(^EQUIVAL($I,NBD)) Q:NBD=-1  S NUEQ=-1 F %ORN=1:1 S NUEQ=$N(^EQUIVAL($I,NBD,NUEQ)) Q:NUEQ=-1  D TR
 S LI=LI+1,LIGNE=LSTAR D STO1
 Q
TR S (RCD,RFC)=^EQUIVAL($I,NBD,NUEQ) Q:'($D(@("^[QUI]CTACHCPT(YA,"_RFC_")")))  S RFC=@("^[QUI]CTACHCPT(YA,"_RFC_")"),TBR=$P(RFC,"^",2),TBF=$P(RFC,"^",1),TBR=$J(TBR,9,2),NRO=$J(NBD,2,0),TBF=$E(TBF,1,12)
 S RCT="" F %U=2:2 S ITC=$P(RCD,"""",%U) Q:ITC=""  S RCT=RCT_ITC_"/"
 S LDEN=$L(RCT),%DDEP=1 D GETREF S LIGNE=REF,%CH=" | "_TBF,%LGR=51-$L(REF) D ^%QZCHBK S LIGNE=LIGNE_%CH,%CH=" | "_TBR,%LGR=73-$L(LIGNE) D ^%QZCHBK S LIGNE=LIGNE_%CH_" | "_NRO_" |" D STO
 S FLG=" |              |           |    |"
 F %GGG=1:1 Q:LDEN'>0  D GETREF S LIGNE=REF,%CH=FLG,%LGR=80-$L(LIGNE) D ^%QZCHBK S LIGNE=LIGNE_%CH D STO
 Q
STO S LI=LI+1 I LI>LILIM S OLIGNE=LIGNE,LIGNE=LSTAR D STO1 S EGAP=EGAP+1,LI=5 D TET
STO1 S ^AFFPAG($I,EGAP,LI)=LIGNE Q
TET F LIGNE=LSTAR,TITRE,LSTAR,OLIGNE D STO
 Q
GETREF S PLDIS=47,REF="| " F %III=%DDEP:1 S P=$P(RCT,"/",%III),LDEN=(LDEN-$L(P))-1,PLDIS=(PLDIS-$L(P))-1 Q:PLDIS<0  S REF=REF_P_"/" Q:LDEN'>0
 S %DDEP=%III Q
I D ZD^%QMDATE4,^%QMDAK0 S LILIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-6,1:60),DOLARI=$I,IMPR=0 I $D(^TABIDENT(WHOIS,"PRINTER")) S IMPR=^TABIDENT(WHOIS,"PRINTER")
 S LI=LILIM,EGAP=0 D TR1 O IMPR U IMPR F PAGE=1:1 Q:'($D(^AFFPAG(DOLARI,PAGE)))  D ENTET F LI=6:1 Q:'($D(^AFFPAG(DOLARI,PAGE,LI)))  W !,^AFFPAG(DOLARI,PAGE,LI)
 W !,# C IMPR Q
ENTET W #,"Le : ",%DAT," a : ",HEURE,"    *** COUTS D'UN ARTICLE ***",?65,"Page : ",PAGE,!,"Cout pour : ",YA,!
 Q


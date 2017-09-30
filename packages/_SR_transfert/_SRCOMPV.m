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

;%SRCOMPV^INT^1^59547,73891^0
SRCOMPV ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
VALEG(GLERR,GL,GLC,NOCH) 
 N NO,NOCOMP,NOREF,REF,VAL,OP,MER1,MER2,NOFIC,CONT,MERR,CP,ETOU,GLC2
 N ERREUR
 S GLC2=$$CONCAT^%QZCHAD(GLC,"""VALEG"","_NOCH)
 S GLC2=$E(GLC2,1,$L(GLC2)-1)_","
 K @GLC@("VALEG",NOCH)
 S MER=$$M^%SRVALID(NOCH)_$$^%QZCHW("Val legales")_" "_$$^%QZCHW("fiche")_" "
 S NO=1,NOCOMP=0,NOREF=1,ERREUR=0
 S NOFIC=""
BFIC S NOFIC=$O(@GL@("CHAMPS",NOCH,"VALEG",NOFIC))
 G:NOFIC="" FVALEG
 S CONT=@GL@("CHAMPS",NOCH,"VALEG",NOFIC)
 S MER1=MER_NOFIC_", "
 S NO=2
BVALEG S OP=$$GETLBLAN^%VTLBLAN($P(CONT,$C(0),NO))
 G:OP="" FBVAL
 S REF=0
 S NO=NO+1,NOCOMP=NOCOMP+1
 S VAL=$$GETLBLAN^%VTLBLAN($P(CONT,$C(0),NO))
 S NO=NO+1
 I VAL="" D INS^%SRVALID(GLERR,MER1_$$^%QZCHW("Valeur(s) non definie(s) en ligne")_" "_((NO\3)+1)) S REF=1 G ETOU
 S REF=$$OPERAT(OP_" "_VAL,.MERR,.CP)
 I REF D INS^%SRVALID(GLERR,MER1_MERR_" "_$$^%QZCHW("en ligne")_" "_((NO\3)+1)) G BVALEG
ETOU S ETOU=$$GETLBLAN^%VTLBLAN($P(CONT,$C(0),NO))
 S NO=NO+1
 I ETOU'="",(ETOU'="ET")&(ETOU'="OU") D INS^%SRVALID(GLERR,MER1_ETOU_", "_$$^%QZCHW("ET/OU incorrect en ligne")_" "_((NO\3)+1)) S ERREUR=1 G BVALEG
 I REF S ERREUR=1 G BVALEG
 I ETOU="" S @GLC@("VALEG",NOCH,NOREF)="X "_GLC2_NOREF_",1)",@GLC@("VALEG",NOCH,NOREF,NOCOMP)="S OK="_CP,NOREF=NOREF+1,NOCOMP=0 G BVALEG
 G @ETOU
ET S @GLC@("VALEG",NOCH,NOREF,NOCOMP)="X "_GLC2_NOREF_","_(NOCOMP+1)_") S OK=OK&"_CP
 S @GLC@("VALEG",NOCH,NOREF,NOCOMP+1)="S OK=1"
 G BVALEG
OU S @GLC@("VALEG",NOCH,NOREF,NOCOMP)="X "_GLC2_NOREF_","_(NOCOMP+1)_") S OK=OK!"_CP
 S @GLC@("VALEG",NOCH,NOREF,NOCOMP+1)="S OK=0"
 G BVALEG
 
FBVAL F %I=NO:1:$L(CONT,$C(0)) I $$GETLBLAN^%VTLBLAN($P(CONT,$C(0),%I))'="" D INS^%SRVALID(GLERR,MER1_$$^%QZCHW("""trous"" dans valeurs")) S ERREUR=1 Q
 G BFIC
 
FVALEG 
 I ERREUR K @GLC@("VALEG",NOCH) S @GLC@("VALEG",NOCH,0)="S OK=0" G FVAL
 
 I '($D(@GLC@("VALEG",NOCH,1))) S @GLC@("VALEG",NOCH,0)="S OK=2" G FVAL
 
 I '($D(@GLC@("VALEG",NOCH,NOREF))) S @GLC@("VALEG",NOCH,NOREF)=""
 S @GLC@("VALEG",NOCH,0)="S OK=0 F %I=1:1:"_NOREF_" X "_GLC2_"%I) Q:OK"
FVAL Q ERREUR
 
OPERAT(PARA,MERR,OPR) 
 N REFUSE,C,OPER,OP1,POS,LONG,NEG,OP
 S REFUSE=0,MERR="",NEG=""
 S OPR=""
 S POS=1,LONG=$L(PARA),OPER=""
 D LEC
 I C="'" S NEG="'" D LEC
 I "=<>"[C S OPER=C D LEC G UNAI
 I "[]"'[C S REFUSE=1,MERR=$$^%QZCHW("=, <, >, [, ], [], ]], ][, [[ ou sa negat. attendu") G FOPERAT
 S OPER=C D LEC
 I "[]"'[C G UNAI
 S OPER=OPER_C
 D LEC,OP
 G:REFUSE FOPERAT
 S OP1=OP
 I C'="," S REFUSE=1,MERR=$$^%QZCHW(""","" attendue entre les 2 param") G FOPERAT
 D LEC,OP
 G:REFUSE FOPERAT
 I C'="" S REFUSE=1,MERR=$$^%QZCHW("Caracteres en trop") G FOPERAT
 S OPR="("_NEG_"((VAL"_$S($E(OPER)="[":"'<",1:">")_OP1_")&(VAL"_$S($E(OPER,2)="[":"<",1:"'>")_OP_")))"
 
FOPERAT Q REFUSE
 
UNAI D OP
 G:REFUSE FOPERAT
 D NORMALIS^%QZNBN1(.OP)
 S OPR=OPR_"!(VAL"_OPER_OP_")"
 G:C'="," UNAI2
 I "=["[OPER D LEC G UNAI
 S REFUSE=1,MERR=OPER_" "_$$^%QZCHW("un seul parametre")
 G FOPERAT
UNAI2 I C'="" S REFUSE=1,MERR=$$^%QZCHW("caracteres en trop") G FOPERAT
 S OPR=NEG_"("_$E(OPR,2,999)_")"
 G FOPERAT
 
OP S OP=""
 G:(((C=".")!(C?1N))!(C="-"))!(C="+") OPNOMB
 
CHAINE N B
 I C'="""" S MERR=$$^%QZCHW("Une chaine de caracteres etait attendue et doit debuter par "" ..."),REFUSE=1 Q
 D LEC1 S OP=""""
CHAIN1 F B=0:0 Q:(C="""")!(C="")  S OP=OP_C D LEC1
 I C'="""" S MERR=$$^%QZCHW("Une chaine de caracteres doit se terminer par "" ..."),REFUSE=1 Q
 S OP=OP_"""" D LEC1
 I C="""" S OP=OP_C D LEC1 G CHAIN1
 Q
 
NUM 
 N %B
 I C'?1N S MERR=$$^%QZCHW("Un numerique etait attendu"),REFUSE=1 Q
 S OP=""
 F %B=0:0 Q:C'?1N  S OP=OP_C D LEC1
 Q
 
OPNOMB 
 N B
 I (C="-")!(C="+") S OP=C D LEC
 G:C="." OPN2
 I C'?1N S REFUSE=1 Q
 S OP=OP_C D LEC F B=0:0 Q:C'?1N  S OP=OP_C D LEC
 Q:C'="."
OPN2 S OP=OP_"." D LEC
 F B=0:0 Q:C'?1N  S OP=OP_C D LEC
 Q
 
LEC S C=$E(PARA,POS)
 S POS=POS+1
 Q:C'=" "
 G LEC
 
LEC1 S C=$E(PARA,POS)
 S POS=POS+1
 Q


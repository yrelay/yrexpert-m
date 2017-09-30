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

;%QMEXCT^INT^1^59547,73878^0
%QMEXCT(REP,IND) ;;10:33 AM  12 May 1993; 07 Dec 92  2:52 PM ; 12 May 93  9:45 AM
 
 N GLO,ATTCXT,GSEL,UCO,VAL,I,MES,V,VCH,MM
 S ATTCXT="CONTEXTE.D.ACTIVATION"
 S GLO=$$TEMP^%SGUTIL,GSEL=$$TEMP^%SGUTIL,UCO=$$TEMP^%SGUTIL
 S VAL=$$^%QSCALIN(REP,IND,"CONTEXTE.D.ACTIVATION",1)
 I ((((VAL'="INDIVIDU")&(VAL'="LISTE"))&(VAL'="REQUETE"))&(VAL'="LIES"))&(VAL'="REPERTOIRE") D PA^%QSGESTI(REP,IND,"CONTEXTE.D.ACTIVATION","INDIVIDU",1) S VAL="INDIVIDU"
 S MES="               CONTEXTE COURANT D'EXECUTION :                              "
 S MES=MES_"                                                                           "
 D:VAL="INDIVIDU" DEFIND D:VAL="LISTE" DEFLIS D:VAL="REQUETE" DEFREQ D:VAL="LIES" DEFLIES D:VAL="REPERTOIRE" DEFREP
 S MES=MES_"                                                                           "
 S MES=MES_"Voulez-vous changer ce contexte ?"
 Q:$$CONFIRM^%PKUTIL(2,6,75,MES)'=1
 S @GLO@(1)=$$^%QZCHW("individu")
 S @GLO@(2)=$$^%QZCHW("liste d'individus")
 S @GLO@(3)=$$^%QZCHW("liste d'individus repondant aux criteres d'une requete")
 S @GLO@(4)=$$^%QZCHW("ensemble d'individus lies")
 S @GLO@(5)=$$^%QZCHW("tous les individus d'un repertoire")
 S @GLO=""
 S @UCO@("AFF")="$$AFF^%QMEXCT"
 S @UCO@("FULL")="$$FULL^%QMEXCT"
 S @UCO@("?")="PTING^%QMEXCT"
 D ^%QULCHP(GLO,GSEL,UCO,"contexte d'activation",10,10,5,1)
 Q:'($D(@GSEL))
 S VCH=$O(@GSEL@(""))
 G:VCH=1 SAISIND G:VCH=2 SAISLIS G:VCH=3 SAISREQ G:VCH=4 SAISLIES G:VCH=5 SAISREP
 
RETGO 
 Q
AFF(TAB) N VAL
 S VAL=@GLO@(@TAB@("O"))
 Q VAL
FULL(TAB) N VAL
 S VAL=@GLO@(@TAB@("O"))
 Q VAL
PTING(TAB) 
 S VAL=@TAB@("O")
 I VAL=1 S MES="Les traitements associes a cet etat seront executes sur un individu" G AFFMES
 I VAL=2 S MES="Les traitements associes a cet etat seront executes sur les individus d'une liste" G AFFMES
 I VAL=3 S MES="Les traitements associes a cet etat seront executes sur des individus qui remplissent les criteres d'une requete" G AFFMES
 
 I VAL=4 S MES="Les traitements associes a cet etat seront executes sur des individus lies a un individu" G AFFMES
 I VAL=5 S MES="Les traitements associes a cet etat seront executes sur tous les individus d'un repertoire" G AFFMES
AFFMES D MESS^%PKUTIL(5,5,MES,0)
 Q
 
SAISIND 
 D SAISIE^%QMEXCT1(REP,IND,ATTCXT)
 G RETGO
 
SAISLIS 
 D SAISIE^%QMEXCT5(REP,IND,ATTCXT)
 G RETGO
 
SAIS4 D SAISIE^%QMEXCT5(REP,IND,ATTCXT)
 G RETGO
 
SAIS5 D SAISIE^%QMEXCT6(REP,IND,ATTCXT)
 G RETGO
 
SAISREQ 
 D SAISIE^%QMEXCT6(REP,IND,ATTCXT)
 G RETGO
 
SAISLIES 
 D SAISIE^%QMEXCTL(REP,IND,ATTCXT)
 G RETGO
 
SAISREP 
 D SAISIE^%QMEXCTR(REP,IND,ATTCXT)
 G RETGO
 
SAIS7 G RETGO
 
 
DEFIND 
 S V=$$^%QSCALIN(REP,IND,ATTCXT,3)
 S:(V=" ")!(V="") V=$$^%QZCHW("focus")
 S MM=$$^%QZCHW("Individu")
 S MES=MES_MM_" "_V_$J("",(74-$L(V))-$L(MM))
 S V=$$^%QSCALIN(REP,IND,ATTCXT,2)
 S:(V=" ")!(V="") V=$$^%QZCHW("focus")
 S MM=$$^%QZCHW("Du repertoire")
 S MES=MES_MM_" "_V_$J("",74-$L(V))
 Q
DEFLIS 
 S V=$$^%QSCALIN(REP,IND,ATTCXT,2)
 I V=" " S MM=$$^%QZCHW("Individus du repertoire focus"),MES=MES_MM_$J("",75-$L(MM)) Q
 S MM=$$^%QZCHW("Individus de la liste")
 S MES=MES_MM_" "_V_$J("",74-$L(V))
 D PARAL
 Q
DEFREQ 
 S MM=$$^%QZCHW("Individus")
 S V=$$^%QSCALIN(REP,IND,ATTCXT,3)
 S MM=MM_" "_$S((V="")!(V=" "):"du repertoire focus",1:"de la liste "_V)
 S MES=MES_MM_$J("",75-$L(MM))
 S MM=$$^%QZCHW("remplissant les criteres de la requete")
 S MES=MES_MM_$J("",75-$L(MM))
 S V=$$^%QSCALIN(REP,IND,ATTCXT,2)
 S MES=MES_V_$J("",75-$L(V))
 D PARAL
 Q
DEFREP 
 S MM=$$^%QZCHW("Individus")
 S V=$$^%QSCALIN(REP,IND,ATTCXT,2)
 S MM=MM_" "_$S((V="")!(V=" "):"du repertoire focus",1:"du repertoire "_V)
 S MES=MES_MM_$J("",75-$L(MM))
 D PARAL
 Q
 
DEFPRED 
 S MES=MES_"Individus remplissant les conditions du predicat                           "
 S V=$$^%QSCALIN(REP,IND,ATTCXT,2)
 S MES=MES_V_$J("",75-$L(V))
 D PARAL
 Q
DEFLIES 
 S V=$$^%QSCALIN(REP,IND,ATTCXT,2)
 S MM=$$^%QZCHW("Individus lies par le lien ")
 S MES=MES_MM_V_$J("",(75-$L(V))-$L(MM))
 S V=$$^%QSCALIN(REP,IND,ATTCXT,3)
 S:V=" " V="focus"
 S MM=$$^%QZCHW("A l'individu ")
 S MES=MES_MM_V_$J("",(75-$L(V))-$L(MM))
 D PARAL
 Q
PARAL S V=$$^%QSCALIN(REP,IND,ATTCXT,"PARALLELISABLE")
 S V=$S(V="NON":" ("_$$^%QZCHW("activation non partagee")_")",1:" ("_$$^%QZCHW("activation parallele possible")_")")
 S MES=MES_V_$J("",75-$L(V))
 Q
 
 
 
 
MAJ N ETAT
 S ETAT="" F %E=0:0 S ETAT=$$NXTRI^%QSTRUC8("ETAT.RESEAU",ETAT) Q:ETAT=""  S V=$$^%QSCALIN("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION",1) D MAJV
 Q
MAJV G:V=1 MAJV1 G:V=2 MAJV2 G:V=3 MAJV3 G:V=4 MAJV4
MAJV1 
 D PA^%QSGESTI("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION","INDIVIDU",1)
 D PA^%QSGESTI("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION"," ",2)
 D PA^%QSGESTI("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION"," ",3)
 Q
MAJV2 
 D PA^%QSGESTI("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION","INDIVIDU",1)
 S V=$$^%QSCALIN("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION",2)
 D PA^%QSGESTI("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION",$S(V="":" ",1:V),2)
 S V=$$^%QSCALIN("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION",3)
 D PA^%QSGESTI("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION",$S(V="":" ",1:V),3)
 Q
MAJV3 
MAJV4 
 D PA^%QSGESTI("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION","LISTE",1)
 S V=$$^%QSCALIN("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION",2)
 D PA^%QSGESTI("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION",$S(V="":" ",1:V),2)
 Q
MAJV5 
 D PA^%QSGESTI("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION","REQUETE",1)
 S V=$$^%QSCALIN("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION",2)
 D PA^%QSGESTI("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION",$S(V="":" ",1:V),2)
 S V=$$^%QSCALIN("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION",3)
 D PA^%QSGESTI("ETAT.RESEAU",ETAT,"CONTEXTE.D.ACTIVATION",$S(V="":" ",1:V),3)
 Q
 Q


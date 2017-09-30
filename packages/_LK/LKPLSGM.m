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

;LKPLSGM^INT^1^59547,74867^0
LKPLSGM ;;11:26 AM  20 Oct 1993; 23 Sep 93  9:15 AM ; 20 Oct 93  9:35 AM
 
 
 
 
 
 
 
MVT(MVT,DATJOUR,LISTERR) 
 N REPA,REPS,REPM,TYPVT,TYPES,CAT,NAT,MES,ART,STAT,LLOTART,LLOTSTA,LARTLOT
 N DEPENSES,LMMJVSD,NOMSTK,%N,RACPOP,XX,MSG,QTE,OQTE,QTAFF
 N CLIENT,REBUT
 
 S REPA=$$NOMINT^%QSF("ARTICLE")
 S REPS=$$NOMINT^%QSF("STATION.DE.PRODUCTION")
 S REPM=$$NOMINT^%QSF("MOUVEMENT")
 
 S TYPVT=$$^%QSCALIN(REPM,MVT,"TYPE.DE.MOUVEMENT",1)
 S TYPES=$$^%QSCALIN(REPM,MVT,"TYPE.MOUVEMENT.E.S",1)
 S (CLIENT,REBUT)=0
 I TYPVT="DECLARATION.PRODUIT.FINI" S CAT="PRODUIT",NAT=$S(TYPES="ENTREE":"+",1:"-") G S
 I TYPVT="CORRECTION.PRODUIT.FINI" S CAT="PRODUIT",NAT=$S(TYPES="ENTREE":"+",1:"-") G S
 I TYPVT="INVENTAIRE.PRODUIT.FINI" S CAT="PRODUIT",NAT="=" G S
 I TYPVT="DECLARATION.RBT.PRODUIT.FINI" S CAT="PRODUIT",NAT="-",REBUT=1 G S
 I TYPVT="DECLARATION.STOCK.ENTREE" S CAT="ENTREE",NAT=$S(TYPES="ENTREE":"+",1:"-") G S
 I TYPVT="CORRECTION.STOCK.ENTREE" S CAT="ENTREE",NAT=$S(TYPES="ENTREE":"+",1:"-") G S
 I TYPVT="INVENTAIRE.STOCK.ENTREE" S CAT="ENTREE",NAT="=" G S
 I TYPVT="DECLARATION.RBT.STOCK.ENTREE" S CAT="ENTREE",NAT="-",REBUT=1 G S
 I TYPVT="DECLARATION.EN.COURS" S CAT="ENCOURS",NAT=$S(TYPES="ENTREE":"+",1:"-") G S
 I TYPVT="INVENTAIRE.EN.COURS" S CAT="ENCOURS",NAT="=" G S
 I TYPVT="CORRECTION.EN.COURS" S CAT="ENCOURS",NAT=$S(TYPES="ENTREE":"+",1:"-") G S
 I TYPVT="DECLARATION.RBT.EN.COURS" S CAT="ENCOURS",NAT="-",REBUT=1 G S
 I TYPVT="LIVRAISON.CLIENT" S CAT="PRODUIT",NAT="-",CLIENT=1 G S
 
S 
 
 
 
 
 
 
 S MES=$S(NAT="+":"Entree",NAT="-":"Sortie",NAT="=":"Inventaire")
 S ART=$$^%QSCALIN(REPM,MVT,"ARTICLE",1)
 G:CAT="ENCOURS" INIENC
 G:CAT="PRODUIT" INIPROD
 
 
 
 
 
 
 
 
 S REPSTO=$$NOMINT^%QSF("STOCK.ENTREE"),LLOTART="ARTICLE.DE.STOCK.ENTREE",LLOTSTA="EN.ENTREE.DE",LARTLOT="STOCK.ENTREE.DE"
 S RACPOP="STK",MES=MES_"Stock entree de "
 G CRELOT
INIENC 
 S REPSTO=$$NOMINT^%QSF("EN.COURS.PRODUCTION"),LLOTART="ARTICLE.DE.EN.COURS",LLOTSTA="EN.PRODUCTION.A",LARTLOT="EN.COURS.PRODUCTION.DE"
 S RACPOP="ENC",MES=MES_" stock en cours pour "
 G CRELOT
INIPROD 
 S REPSTO=$$NOMINT^%QSF("PRODUIT.FINI"),LLOTART="ARTICLE.DE.PRODUIT.FINI",LLOTSTA="EN.SORTIE.DE",LARTLOT="PRODUIT.FINI.DE"
 S RACPOP="PRD",MES=MES_" de produit fini pour "
 G CRELOT
 
CRELOT 
 S QTE=$$^%QSCALIN(REPM,MVT,"QUANTITE",1)
 S STAT=$$^%QSCALIN(REPM,MVT,"STATION.DE.PRODUCTION",1)
 S V(1)=MES_ART_" pour "_STAT
 S XX=$$TRACER^%TLOB11(1,1)
 
 D CRELOT^LKPLSG2
 D:CAT="PRODUIT" PA^%QSGESTI(REPA,ART,"STOCK.DISPONIBLE",QTAFF,1)
 
 
 
 
STATION S PRIX=$$^%QSCALIN(REPA,ART,"PRIX.DE.REVIENT.COMMERCIAL",1)
 S:PRIX="" PRIX=1
 S LMMJVSD=$$DATET^%QMDATE2(3,DATJOUR,2)
 S DEPENSES=QTE*PRIX
 S SEMA="STATION."_STAT
 F %I=1:1 Q:$$ZA^%SYSSEMA(QUI,SEMA,5)
 G:CAT="ENCOURS" STATEN G:CAT="PRODUIT" STATPF
 
 
 
 
 D MAJSTOCK^LKPLSG2("STOCK.ENTREE")
 G:NAT'="+" ENT2
 
 D PA^%QSGESTI(REPS,STAT,"DEPENSES.ACHAT",$$^%QSCALIN(REPS,STAT,"DEPENSES.ACHAT",LMMJVSD)+DEPENSES,LMMJVSD)
 D PA^%QSGESTI(REPS,STAT,"DEPENSES.ACHAT",$$^%QSCALIN(REPS,STAT,"DEPENSES.ACHAT",1)+DEPENSES,1)
ENT2 
 S VAL=$$^%QSCALIN(REPS,STAT,"VALEUR.STOCK.ENTREE",1)+$S(NAT="+":DEPENSES,NAT="-":DEPENSES*-1,NAT="=":DEPENSES-(ANCIEN*PRIX))
 D PA^%QSGESTI(REPS,STAT,"VALEUR.STOCK.ENTREE",VAL,1)
 G STATFIN
 
 
 
STATEN 
 
 D MAJSTOCK^LKPLSG2("STOCK.EN.COURS")
 
 G:NAT'="-" STATENF
 
 S QMH=$$^%QSCALIN(REPA,ART,"QUANTITE.FABRIQUEE.PAR.HEURE",1)
 S:QMH="" QMH=$$^%QSCALIN("CONSTANTES","TXP.CONSTANTES","QUANTITE.FABRIQUEE.PAR.HEURE",1)
 S COUT=$$^%QSCALIN(REPS,STAT,"COUT.DE.L.HEURE.DE.PRODUCTION.NORMALE",1)
 S:COUT="" COUT=$$^%QSCALIN("CONSTANTES","TXP.CONSTANTES","COUT.DE.L.HEURE.DE.PRODUCTION.NORMALE",1)
 S DEPH=(QTE/QMH)*COUT
 D PA^%QSGESTI(REPS,STAT,"DEPENSES.MAIN.D.OEUVRE",$$^%QSCALIN(REPS,STAT,"DEPENSES.MAIN.D.OEUVRE",LMMJVSD)+DEPH,LMMJVSD)
 D PA^%QSGESTI(REPS,STAT,"DEPENSES.MAIN.D.OEUVRE",$$^%QSCALIN(REPS,STAT,"DEPENSES.MAIN.D.OEUVRE",1)+DEPH,1)
 
STATENF S VAL=$$^%QSCALIN(REPS,STAT,"VALEUR.STOCK.EN.COURS",1)+$S(NAT="+":DEPENSES,NAT="-":DEPENSES*-1,NAT="=":DEPENSES-(ANCIEN*PRIX))
 D PA^%QSGESTI(REPS,STAT,"VALEUR.STOCK.EN.COURS",VAL,1)
 G STATFIN
 
 
 
STATPF 
 
 D MAJSTOCK^LKPLSG2("STOCK.PHYSIQUE")
 D PA^%QSGESTI(REPS,STAT,"STOCK.DISPONIBLE",VAL,ART)
 
 G:NAT="=" STATPF3 G:NAT="-" STATPF2
 
 G:$$^%QSCALIN(REPS,STAT,"TYPE.DE.STATION",1)'="FOURNISSEUR" STATPFF
 D PA^%QSGESTI(REPS,STAT,"DEPENSES.ACHAT",$$^%QSCALIN(REPS,STAT,"DEPENSES.ACHAT",1)+DEPENSES,1)
 D PA^%QSGESTI(REPS,STAT,"DEPENSES.ACHAT",$$^%QSCALIN(REPS,STAT,"DEPENSES.ACHAT",LMMJVSD)+DEPENSES,LMMJVSD)
 G STATPFF
 
 
STATPF2 G:REBUT STATPFF
 D PA^%QSGESTI(REPS,STAT,"RECETTES",$$^%QSCALIN(REPS,STAT,"RECETTES",1)+DEPENSES,1)
 D PA^%QSGESTI(REPS,STAT,"RECETTES",$$^%QSCALIN(REPS,STAT,"RECETTES",LMMJVSD)+DEPENSES,LMMJVSD)
 G:'(CLIENT) STATPFF
 D PA^%QSGESTI(REPS,"COMMERCIAL","RECETTES",$$^%QSCALIN(REPS,"COMMERCIAL","RECETTES",1)+DEPENSES,1)
 D PA^%QSGESTI(REPS,"COMMERCIAL","RECETTES",$$^%QSCALIN(REPS,"COMMERCIAL","RECETTES",LMMJVSD)+DEPENSES,LMMJVSD)
 G STATPFF
STATPF3 
STATPFF S VAL=$$^%QSCALIN(REPS,STAT,"VALEUR.STOCK.PRODUIT.FINI",1)+$S(NAT="+":DEPENSES,NAT="-":DEPENSES*-1,NAT="=":DEPENSES-(ANCIEN*PRIX))
 D PA^%QSGESTI(REPS,STAT,"VALEUR.STOCK.PRODUIT.FINI",VAL,1)
 G STATFIN
 
STATFIN D ZD^%SYSSEMA(QUI,SEMA)
 
 D PA^%QSGESTI(REPM,MVT,"ETAT","TRAITE",1)
 Q


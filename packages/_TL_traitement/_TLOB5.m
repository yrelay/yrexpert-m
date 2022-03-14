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

;%TLOB5^INT^1^59547,74030^0
%TLOB5 ;;06:53 PM  22 Sep 1993; ; 20 Oct 93  9:36 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
FEXTER(IDEB,NBREG) 
 N VAL1,VAL2,VAL3,VAL4,VAL5
 I V(IDEB)="PARCOURS.LIEN" G PARCOL
 I V(IDEB)="QARBRE" D QARBRE Q 1
 I V(IDEB)="DIALOGUE" G DIAL
 I V(IDEB)="RESULTAT.TEST.REQUETE" G TESTRQ
 I V(IDEB)="INCREMENTER.NUMERO" G INCNUM
 I V(IDEB)="LIEN.VERS.GLOBAL" G QULARG
 I V(IDEB)="SAISIR.ATTRIBUT.MULTIVALUE" D SAISATT1 Q 1
 I V(IDEB)="SAISIR.DEUX.ATTRIBUTS.MULTIVALUES" D SAISATT2 Q 1
 I V(IDEB)="IMPLANTATION" D ^%TXQFEXT Q 1
 I V(IDEB)="PASSERELLE.DELINS" D PASDEL Q 1
 I V(IDEB)="PASSERELLE.MOUVEMENT" D PASMOUV Q 1
 I V(IDEB)="PROPAGATION" D PROPA Q 1
 I V(IDEB)="RECHERCHER.LIENS.WEB" D RLWEB Q 1
 I $E(V(IDEB),1,3)="TXP" D FEXTXP Q 1
 Q 1
 
INCNUM 
 S VAL1=V(IDEB+5),VAL2=V(IDEB+10)
 D NFONC^%QCAPOP(VAL1,VAL2)
 Q 1
 
TESTRQ 
 
 S VAL1=V(IDEB+5),VAL2=V(IDEB+10),VAL3=V(IDEB+15),VAL4=V(IDEB+20),VAL5=V(IDEB+25)
 D ^%QSTSTEC(VAL1,VAL2,VAL3,VAL4,VAL5)
 Q 1
 
DIAL D MEMX^%QCAMEM
 S VAL1=PARCO("REP"),VAL2=PARCO("IND"),VAL3=V(IDEB+5),VAL4=V(IDEB+9)
 K (QUI,WHOIS,VAL1,VAL2,VAL3,VAL4) D CURRENT^%IS,VARSYS^%QCSAP
 D DIALOGUE^%QSATTRI(VAL2,VAL1,VAL3,VAL4)
 D RMEMX^%QCAMEM
 Q 1
 
 
 
PARCOL I V(IDEB+5)="INIT" D INITDK Q 1
 I V(IDEB+5)="SUIVANT" D NEXTDK Q 1
 I V(IDEB+5)="FIN" D FINDK Q 1
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
INITDK N XNEXT,XEVPDS,TEMP,TRS,TPD,TPDV,NUMSTR,TOT,XXN,ATTTRI,TXPLO,MXPLO
 N LARGEUR,LONGUEUR,ATSTRI,PSTRI,PRFMAX
 
 N VAL1,VAL2,VAL3,VAL4,RESUL
 S VAL1=V(IDEB+10),VAL2=V(IDEB+15),VAL3=V(IDEB+20),VAL4=V(IDEB+25)
 S MOX=V(IDEB+40)
 
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK"),LARGEUR=0,LONGUEUR=0
 S NUMSTR=$$GEN^%QCAPOP("STR")
 S TEMP=$$CONCAS^%QZCHAD(TPD,NUMSTR) K @(TEMP)
 S TRSDK=$$CONCAS^%QZCHAD(TEMP,"T")
 S TXPLO=$P(MOX,",",2)
 I (TXPLO'=0)&(TXPLO'=1) S TXPLO=2
 S MXPLO=$P(MOX,",")
 I (MXPLO'="PROFONDEUR")&(MXPLO'="LARGEUR") S MXPLO="NORMAL"
 S PRFMAX=$P(MOX,",",3)
 S:'($$ENT^%QZNBN(PRFMAX)) PRFMAX=9999
 S PSTRI=1,XEVPDS=""
BCLAT S ATSTRI=$P(VAL4,",",PSTRI) G:ATSTRI="" BCLFIN
 S ATTTRI=$E(ATSTRI,2,$L(ATSTRI))
 S VALPDS=$S(ATTTRI="DEGRE.EXTERIEUR":"$$PDFILS^%QULARB2(CHEM)",ATTTRI="NOMBRE.SUCCESSEURS":"$$PDSUCC^%QULARB2(CHEM)",ATTTRI="PROFONDEUR.DANS.GRAPHE":"$$PDPROF^%QULARB2(CHEM)",1:"$$PDATT^%QULARB("""_$$NOMINT^%QSF(VAL1)_""",NEX,"""_ATTTRI_""",1)")
 S XEVPDS=XEVPDS_$S($E(ATSTRI)=">":"-",1:"")_VALPDS_"_"",""_"
 S PSTRI=PSTRI+1
 G BCLAT
BCLFIN S XEVPDS="S POIDS="_XEVPDS_"1"
 S XNEXT="S NEX=$$NXTRIAV^%QSTRUC8("""_$$NOMINT^%QSF(VAL1)_""",INDIV,"""_VAL3_""",NEX)"
 D INIT^%QULARBU(VAL2,XNEXT,XEVPDS,TRSDK,TXPLO,MXPLO,NUMSTR,PRFMAX)
 
 
 S RESUL=$$AFF^%TLOPT(V(IDEB+28),V(IDEB+29),V(IDEB+26),V(IDEB+27),NUMSTR)
 S MAXL=0,XXN=0 F TOT=0:1 S XXN=$$NEXT^%QULARBU(NUMSTR,XXN) Q:XXN=0  I $L(XXN,",")>MAXL S MAXL=$L(XXN,",")
 S TOT=TOT_","_MAXL
 
 
 S RESUL=$$AFF^%TLOPT(V(IDEB+33),V(IDEB+34),V(IDEB+31),V(IDEB+32),TOT)
 Q
 
PDATT(REP,IND,ATT,ORD) 
 N VAL
 S VAL=$$^%QSCALIN(REP,IND,ATT,ORD) Q:VAL="" 99999 Q VAL
 
 
 
 
 
 
 
 
 
 
NEXTDK N IND,TPD,TRSDK,NEXT,PDS
 N VAL1,VAL2,RESUL
 S VAL1=V(IDEB+10),VAL2=V(IDEB+15)
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK")
 S TEMP=$$CONCAS^%QZCHAD(TPD,VAL1)
 S TRSDK=$$CONCAS^%QZCHAD(TEMP,"T")
 S NEXT=$$NEXT^%QULARBU(VAL1,VAL2,.PDS)
 
 S RESUL=$$AFF^%TLOPT(V(IDEB+28),V(IDEB+29),V(IDEB+26),V(IDEB+27),NEXT)
 
 
 
 I $L(NEXT,",")>1 S RESUL=$$AFF^%TLOPT(V(IDEB+33),V(IDEB+34),V(IDEB+31),V(IDEB+32),@TRSDK@($P(NEXT,",",$L(NEXT,",")-1)))
 I NEXT'=0 S RESUL=$$AFF^%TLOPT(V(IDEB+38),V(IDEB+39),V(IDEB+36),V(IDEB+37),@TRSDK@($P(NEXT,",",$L(NEXT,","))))
 I NEXT'=0 S RESUL=$$AFF^%TLOPT(V(IDEB+43),V(IDEB+44),V(IDEB+41),V(IDEB+42),PDS)
 Q
 
 
 
 
 
 
FINDK N TPD,TEMP
 N VAL1
 S VAL1=V(IDEB+10)
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK") Q:'($D(@TPD))
 S TEMP=$$CONCAS^%QZCHAD(TPD,VAL1) K @(TEMP)
 D NETTOIE^%QULARBU(VAL1)
 Q
 
 
 
QARBRE 
 N TRACE,R1,R2,RESUL
 S TRACE=0
 I V(IDEB+5)="INIT" D INIT^%QARBRE(V(IDEB+10),V(IDEB+15),V(IDEB+20)) Q
 I V(IDEB+5)="OKPLACE" D OKPLAC^%QARBRE(V(IDEB+10),V(IDEB+15),.R1,.R2) S RESUL=$$AFF^%TLOPT(V(IDEB+23),V(IDEB+24),V(IDEB+21),V(IDEB+22),R1),RESUL=$$AFF^%TLOPT(V(IDEB+28),V(IDEB+29),V(IDEB+26),V(IDEB+27),R2) Q
 I V(IDEB+5)="PLACER" D PLACER^%QARBRE(V(IDEB+10)) Q
 Q
 
QULARG 
 D MKGLO^%QULARG(V(IDEB+5),V(IDEB+10),V(IDEB+15),V(IDEB+20),V(IDEB+25))
 Q 1
 
 
FEXTXP 
 I V(IDEB)="TXP.SAISIE.DEMANDE" D DEM^%TXPKSD(V(IDEB+5),V(IDEB+10)) Q
 I V(IDEB)="TXP.SAISIE.CONTRAINTE.STOCK" D UNCSTO^%TXPKSCK(V(IDEB+5),V(IDEB+10)) Q
 I V(IDEB)="TXP.SAISIE.CONTRAINTE.PRODUCTION" D UNCPROD^%TXPKSCK(V(IDEB+5),V(IDEB+10)) Q
 I V(IDEB)="TXP.SAISIE.CAPACITE" D CONTATE^%TXPKSCK(V(IDEB+5),V(IDEB+10)) Q
 Q
 
PASMOUV 
 D ACTIV^LKPLSM(V(IDEB+5),V(IDEB+10)) Q
PASDEL N LIS,R S LIS=$$ACTIV^LKPLSD(V(IDEB+5))
 S R=$$AFF^%TLOPT(V(IDEB+8),V(IDEB+9),V(IDEB+6),$S(V(IDEB+7)=$C(0):1,1:V(IDEB+7)),LIS) Q
PROPA D MVT^LKPLSGM(V(IDEB+5),V(IDEB+10),V(IDEB+15)) Q
 
 
SAISATT1 
 D SAISIE^%SRBATT1(V(IDEB+5),V(IDEB+10),V(IDEB+15),V(IDEB+20),V(IDEB+25),V(IDEB+30),V(IDEB+35),V(IDEB+40),V(IDEB+45),V(IDEB+50))
 Q
SAISATT2 
 D OLD^%SRBATT2(V(IDEB+5),V(IDEB+10),V(IDEB+15),V(IDEB+20),V(IDEB+25),V(IDEB+30),V(IDEB+35),V(IDEB+40),V(IDEB+45),V(IDEB+50),V(IDEB+55))
 Q
 ;

RLWEB
 I V(IDEB)="RECHERCHER.LIENS.WEB" D RLWEB^%FEXTER(V(IDEB+5),V(IDEB+10),V(IDEB+15),V(IDEB+20),V(IDEB+25),V(IDEB+30)) Q
 Q



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

;TO9EXIM2^INT^1^59547,74871^0
TO9EXIM2 ;
 
DEB K ^AVER($I) S PGRIL="^[QUI]RAISON(NUFA,NSFA,AVER)"
 I $D(^[QUI]RAISON(NUFA,NSFA,AVER)) G EXIS
 I '($D(^[QUI]TVPAR(NUFA,NSFA,AVER))) S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("      Parametre IMPLICITE   N'a pas ete evalue !") G FINB
 S %CH=$$^%QZCHW(" Valeur : ")_^[QUI]TVPAR(NUFA,NSFA,AVER),%LGR=35+$L(%CH) D ^%QZCHBK S ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_%CH S:$D(^[QUI]UNITE(SFA,AVER)) ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_$$^%QZCHW("    Unite : ")_^[QUI]UNITE(SFA,AVER)
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="" G FINB
EXIS I $D(^[QUI]RAISON(NUFA,NSFA,AVER))=10 S PGRIL="^[QUI]RAISON(NUFA,NSFA,AVER,NEX)"
 S GRIL=@PGRIL,EXPLI="",TGRIL=$P(GRIL,"(",1) S:(GRIL'["MODIFICATION")&((GRIL'["COPI")&(GRIL'["IMPLICIYST")) CGRIL=@GRIL
 S MSG=$S(TGRIL["NOME":$$^%QZCHW(" Composant de la NOMENCLATURE "),TGRIL["IMPLICI":$$^%QZCHW(" Parametre IMPLICIE "),TGRIL["PHASE":$$^%QZCHW(" Operation de la GAMME "),TGRIL[$$^%QZCHW("MATIERE"):$$^%QZCHW("Famille matiere"),TGRIL["SELMA":$$^%QZCHW("Choix matiere en stock"),1:"SUITCH")
 I MSG="SUITCH" S MSG=$S(TGRIL["OUTCON":$$^%QZCHW("Consignes-outillage"),1:$$^%QZCHW(" Evaluation TEMPS et COUTS "))
 S DC=$S(TGRIL["IMPLI":2,TGRIL["NOME":2,1:1) D FINA G:(TGRIL["MODIFIC")!((TGRIL["COPI")!(TGRIL["SYST")) FINB
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",%CH=$$^%QZCHW("Selectionne(e) car : "),%LGR=20+$L(%CH) D ^%QZCHBK S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=%CH,%CH="..................",%LGR=%LGR-3 D ^%QZCHBK S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=%CH,NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=""
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="         "
 F CAS=1:1 S ITEM=$P(CGRIL,"^",DC) G:ITEM="" FIN D:((CAS-1)#4)=0 DEFITEM D:((CAS-3)#4)=0 DEFITEM2 S:ITEM="[]" ITEM=$$^%QZCHW("compris entre") S ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_ITEM_$$^%QZCHW(" "),DC=DC+1 I (CAS#4)=0 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="         "
FIN I TGRIL["IMPLICI" S K3=$P(GRIL,"""",6) I K3["(",K3["/",K3[")" S DY=DY+1,NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="     "_$S(CAS=1:"",1:$$^%QZCHW("Et"))_$$^%QZCHW(" triplet Alliage/Etat/Norme = ")_$P($P(K3,"(",2),")",1),DDYY=DY G DOLAV
 I CAS=1 S ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_$$^%QZCHW("Acquisition non conditionnee (pas de condition pour ce choix)"),NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=""
DOLAV I $D(^AVER($I)) S AVER=^AVER($I) G DEB
 G FINB
FINA I TGRIL["IM" S COM=$$^%QZCHW("Valeur : "),VAL=^[QUI]TVPAR(NUFA,NSFA,AVER),PFOR=18 D ECRI G FINB
 I TGRIL["NOMENC" S COM=$$^%QZCHW("Quantite : "),VAL=QTC,PFOR=17 D ECRI G FINB
 I TGRIL["MATI" S COM=$$^%QZCHW("Famille : "),VAL=^[QUI]TVPAR(NUFA,NSFA,"FAMMAT") D ECRI G FINB
 I TGRIL["SELM" S COM=$$^%QZCHW("Matiere (Quantite) : "),VAL=^[QUI]TVPAR(NUFA,NSFA,$$^%QZCHW("MATIERE"))_$$^%QZCHW("(Quantite necessaire:")_$P(@("^[QUI]TREEWORK(NUFA,"_NSFA_")"),"^",5)_")",PFOR=17 D ECRI G FINB
 I TGRIL["OUTCON" S COM=$$^%QZCHW("Consignes-Outillages : "),VAL=CS,NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="" D ECRI G FINB
 I TGRIL'["PH" G FORM
 S COM=$$^%QZCHW("Operation : "),VAL=$P(GRIL,"""",8) S:$D(^[QUI]PHAS(NUFA,NSFA,AVER)) VAL=$P(^[QUI]PHAS(NUFA,NSFA,AVER),"/",1),VAL2=$P(^[QUI]PHAS(NUFA,NSFA,AVER),"/",2) S:(TGRIL["MODIFICATION")!(TGRIL["COPI") VAL=^[QUI]PHAS(NUFA,NSFA,AVER),VAL2=$P(VAL,"/",2) D ECRI
QTCT 
O S AVER=VAL_$S(VAL2="":"",1:"/"_VAL2),NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("          Temps/Cout de l'operation : ")_$P(AVER,"/",1)
 I $D(^[QUI]RAISON(NUFA,NSFA,AVER)) G DEB
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("Le savoir faire de ")_$P(@("^[QUI]TREEWORK(NUFA,"_NSFA_")"),"^",2)_$$^%QZCHW(" ne permet pas d'evaluer ")
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("un temps et un cout de fabrication pour l'operation ")_AVER G CONS
FORM S TPS=^[QUI]DUREE(NUFA,NSFA,AVER),PCH=$P(TPS,"^",1) D TO^%QZNBN1 S TPS1=$S(ISNUM=1:PCH,1:0),PCH=$P(TPS,"^",2) D TO^%QZNBN1 S TPS2=$S(ISNUM=1:PCH,1:0)
 S TPST=TPS1+TPS2,CT=^[QUI]COUT(NUFA,NSFA,AVER),DECIM=$S($D(^TABIDENT(WHOIS,"DECIMALES")):^TABIDENT(WHOIS,"DECIMALES"),1:2)
 S COM=$$^%QZCHW("Fabrication : "),VAL=$$^%QZCHW("Temps = ")_TPST_$$^%QZCHW(" Cout = ")_$J(CT,1,DECIM) K DECIM,CT,TPS,TPS1,TPS2,TPST,PCH
 S:(TGRIL'["MODIFICA")&(TGRIL'["COPI") NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("     Evaluation de la preparation :")_$P(CGRIL,"^",17)_" ("_$E($P(CGRIL,"^",18),1)_")" S PFOR=19 D ECRI
CONS I '($D(^[QUI]CONS(NUFA,NSFA,AVER))) G FINB
 S AAVERR=AVER,AVER=^[QUI]CONS(NUFA,NSFA,AVER)_$S($P(AVER,"/",2)="":"",1:"/"_$P(AVER,"/",2)) I $D(^[QUI]RAISON(NUFA,NSFA,AVER)) K ^AVER($I) S ^AVER($I)=AVER G FINB
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("Le savoir faire de ")_$P(@("^[QUI]TREEWORK(NUFA,"_NSFA_")"),"^",2)_$$^%QZCHW(" ne permet pas d'affecter ")
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("de consignes-outillages pour l'operation ")_$P(AVER,"/",1)
 G FINB
ECRI S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="          "_COM_VAL G:GRIL["MATI" FINB I TGRIL["IMPL" S:$D(^[QUI]UNITE(SFA,AVER)) ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_$$^%QZCHW("   Unite : ")_^[QUI]UNITE(SFA,AVER)
 I TGRIL["MODIFICATION" S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("          Valeur fournie par l'operateur") G FINB
 I TGRIL["SYST" S ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_$P(GRIL,"(",2) G FINB
 I TGRIL["COPI" S NUCOP=$P(GRIL,"(",2),NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("          Valeur dupliquee de l'etude ")_NUCOP G FINB
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="          "
 I (TGRIL'["PH")&(TGRIL'["OUTCON") S ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_$$^%QZCHW("Formule de determination de la ")_COM_$P(CGRIL,"^",PFOR),EXP=$P(CGRIL,"^",PFOR) D ^TO9VPFIM I TGRIL["FORM" S EXP=$P(CGRIL,"^",17) D ^TO9VPFIM
FINB Q
LISNOM S NEX=-1 F EE=0:0 S NEX=$N(^[QUI]RAISON(NUFA,NSFA,AVER,NEX)) G:NEX=-1 LISNOM X XY W $P(@("^[QUI]TREEWORK(NUFA,"_NEX_")"),"^",4),"  ? " R *REP I REP=13 S QTC=$P(@("^[QUI]TREEWORK(NUFA,"_NEX_")"),"^",3),DX=$X-3 X XY W "      " Q
 Q
DEFITEM2 I ITEM'["," S PCH=ITEM D TO^%QZNBN1 Q:ISNUM  D ^TO3DEFVA S ITEM=ITEMF_$S(VAPA["?":"",1:"("_VAPA_")") G FINB
 S PGA=$P(ITEM,",",1),PDR=$P(ITEM,",",2),PGT="" F ITEM=PGA,PDR S PCH=ITEM D TO^%QZNBN1 D:'(ISNUM) ^TO3DEFVA S PGT=PGT_$S(ISNUM:ITEM,1:ITEMF_"("_VAPA_")") S:ITEM=PGA PGT=PGT_$$^%QZCHW(" et ")
 S ITEM=PGT Q
DEFITEM D ^TO3DEFVA S ITEM=ITEMF_$S($P(CGRIL,"^",DC+1)="=":"",1:"("_VAPA_")") Q


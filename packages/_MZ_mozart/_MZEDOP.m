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

;%MZEDOP^INT^1^59547,73871^0
%MZEDOP(%LI,%TY,%M,%NLI,%BA) ;;02:43 PM  20 Dec 1996
 
 ;; Ligne OPERATION
 ;; SCR=MOZLIGN1 %TY=1
 ;; 4 PAGE
 ;; RESUL de 1 a 10 RESUL de page 1
 ;; RESUL de 11 a 20 label de page 1
 ;; RESUL de 21 a 30 RESUL de page 2
 ;; RESUL de 31 a 40 label de page 2
 ;; RESUL de 41 a 50 RESUL de page 3
 ;; RESUL de 51 a 60 label de page 3
 ;; RESUL de 61 a 70 RESUL de page 4
 ;; RESUL de 71 a 80 label de page 4
 
 ;; Ligne ACTION
 ;; SCR=MOZLIGN2 %TY=2
 ;; 4 PAGE
 ;; RESUL de 1 a 9 RESUL de page 1
 ;; RESUL de 10 a 18 label de page 1
 ;; RESUL de 19 a 27 RESUL de page 2
 ;; RESUL de 28 a 36 label de page 2
 ;; RESUL de 37 a 45 RESUL de page 3
 ;; RESUL de 46 a 54 label de page 3
 ;; RESUL de 55 a 63 RESUL de page 4
 ;; RESUL de 64 a 72 label de page 4
 
 
 N PX,PY,%CH,%SP,TB,TBIS,%TS,%UTIL,LIM,GLO
 N PAGE,FOIS,MAX ;; cao
 I %TY=1 S MAX=80
 I %TY=2 S MAX=72
 S FOIS=0
 S PAGE=1
 S %BA=0,%NLI=%LI,PY=$Y,PX=$X
 S LIM=$S(%TY=1:10,1:9)  
 
 
 D FIND
A S SCR=^[QUI]MOZ("GRILLE",%UTIL,%TS,%TY) D NORM^%VVIDEO
80 
132 
 I %M="M" W $$XY^%VVIDEO1(0,0) D @("BLK^%VVIDEO,BLD^%VVIDEO"_$S(XOP=2:"",1:",REV^%VVIDEO")) W $$XY^%VVIDEO1(PX,PY) D POS^%MZED,W^%MZED X XY D NORM^%VVIDEO
 S %SP=$C(1),(TB,TBIS,GLO)="^[QUI]MOZ(""GRILLE"",%UTIL,%TS,%TY)",%U="",%W=MAX ;;%W=^%SCRE(SCR)
 K RESUL 
 F %V=1:1:%W S (AFRESU(%V),RESUL(%V))=$$GETLBLAN^%VTLBLAN($P(%LI,%SP,%V))
 ;; cao PAGE2
C1 I SCR="MOZLIGN2" G mSUITE
 ;; ********* "MOZLIGN1" ********************
 ;; PAGE4
 F %V=31:1:40 S (AFRESU(%V+30),RESUL(%V+30))=RESUL(%V)
 F %V=31:1:40 S (AFRESU(%V),RESUL(%V))=""
 ;; PAGE 3
 F %V=21:1:30 S (AFRESU(%V+20),RESUL(%V+20))=RESUL(%V)
 F %V=21:1:30 S (AFRESU(%V),RESUL(%V))=""
 ;; PAGE 2
 
 F %V=11:1:20 S (AFRESU(%V+10),RESUL(%V+10))=RESUL(%V)
 F %V=11:1:20 S (AFRESU(%V),RESUL(%V))=""
 
 
 D UCONT 
 ;; construit label
 F %U=1:1:LIM D PATOUCH(%U)
A1 F %U=31:1:LIM+30 D PATOUCH2(%U,20) ;; PAGE2
A2 F %U=51:1:LIM+50 D PATOUCH2(%U,30) ;; PAGE 3
A3 F %U=71:1:LIM+70 D PATOUCH2(%U,40)  ;; PAGE4
 
 G mSUITE1
 ;*************************************************;
 ;; "MOZLIGN2"
mSUITE 
 F %V=28:1:36 S (AFRESU(%V+27),RESUL(%V+27))=RESUL(%V)
 F %V=28:1:36 S (AFRESU(%V),RESUL(%V))=""
 ;; PAGE 3
 F %V=19:1:27 S (AFRESU(%V+18),RESUL(%V+18))=RESUL(%V)
 F %V=19:1:27 S (AFRESU(%V),RESUL(%V))=""
 ;; PAGE 2
 
 F %V=10:1:18 S (AFRESU(%V+9),RESUL(%V+9))=RESUL(%V)
 F %V=10:1:18 S (AFRESU(%V),RESUL(%V))=""
 
 D UCONT F %U=1:1:LIM D PATOUCH(%U)
 F %U=28:1:LIM+27 D PATOUCH2(%U,18) ;; PAGE2
A2 F %U=46:1:LIM+45 D PATOUCH2(%U,27) ;; PAGE 3
A3 F %U=64:1:LIM+63 D PATOUCH2(%U,36)  ;; PAGE4
mSUITE1 
 F %U=1:1:MAX S:$D(^%SCRE(SCR,%U,"PATOUCH")) PATOUCH(%U)=1
 X XY D NORM^%VVIDEO,CLEPAG^%VVIDEO
AFF S CMS=0,ABENDSCR=0 
AF01 
 D ^%VAFIGRI
 S DX=2,DY=22 X XY W $$^%QZCHW("Page:")_PAGE
 G AFF1 
 
AFF1 
 D ^%VAFISCR2(PAGE)        
 D:%TY=2 OPC(EDCL) 
AFF2 D ^%VMODISC2(PAGE)
mAFF2 I ABENDSCR=1 S %BA=1 G SUIT
FIN 
 I SCR="MOZLIGN1" G OPER
 I (RESUL(1)="")&(SCR="MOZLIGN2") D ^%VZEAVT("Vous n'avez pas defini d'action : ce champ est obligatoire") G AFF
SUIT D OPER^%MZREGL:%TY=1,ACTION^%MZREGL:%TY=2
 G @(^MOZETAT($J,"NBCOL")):'(OK)
 D:ABENDSCR=0 CHAR
EXIT 
 I FOIS=0 G EXIT2
 G EXITFIN
 
EXIT2 
 S DX=2,DY=22 X XY W "            "
 S DX=2,DY=22 X XY W $$^%QZCHW("Page:") 
 S DY=DY+$L("Page:") D ^%VLEC 
 S PAGE=Y1
 I (PAGE'="")&(PAGE<5)&(PAGE>0)&($A(PAGE)<58) G AF01
 I PAGE="" S FOIS=1 G EXIT
 D ^%VSQUEAK G EXIT2
 
EXITFIN 
 D APPKP^%VVIDEO,CLEPAG^%VVIDEO,NORM^%VVIDEO
 D STAT1^%MZWORD
 D NORM^%VVIDEO
 D RF^%MZED
END S RM=80 I '(DTM) O 0:(RM:"S":"")
 S %=1
 D FUCONT
 D RST^%MZED 
 K RESUL,PATOUCH,AFRESU,^GCURGRIL($I,SCR) Q
CHAR S:TB'=TBIS TB=TBIS S %CH="",%U="" F %V=1:1 S %U=$O(@TB@(%U)) Q:%U=""  D ANA
 S %NLI=%CH
AF 
 Q
 ;; SAUVEGARDE    
ANA N CLE,%UU,mVar
 S %PS=$P(@TB@(%U),"^",3)
 ;;W !,%PS,"   ",$P(@TB@(%U),"^",4)
 ;;r a
 ;; cao
 S CLE=$P(@TB@(%U),"^",4)
 S %UU=$$mFIND(CLE)
 ;;W !,"Founded ",%U
 I SCR="MOZLIGN1" S mVar=10
 I SCR="MOZLIGN2" S mVar=9
 
 S %CH=%CH_$J("",(%PS-$L(%CH))-2)_" "_RESUL(%UU-mVar)_%SP 
 ;;w !,%CH 
 Q
 ;;I (%U>20)&(%U<31) S %CH=%CH_$J("",(%PS-$L(%CH))-2)_" "_RESUL(%U)_%SP Q
 ;;I (%U>40)&(%U<51) S %CH=%CH_$J("",(%PS-$L(%CH))-2)_" "_RESUL(%U)_%SP Q
 ;;I (%U>60)&(%U<71) S %CH=%CH_$J("",(%PS-$L(%CH))-2)_" "_RESUL(%U)_%SP Q
 Q
OPC(LI) N LC,CLC
 D BLD^%VVIDEO,^%VZCDB("L I G N E   A C T I O N",0),NORM^%VVIDEO
 K ATT S OP=0,LC=LI F %U=1:1 S LC=$ZP(^U($J,0,LC)) Q:LC=""  S CLC=$P(^U($J,0,LC),"^",1) S:CLC=2 OP=OP+1 I CLC=1 S CLC=$P(^U($J,0,LC),"^",2,999) G OPS
 Q
OPS S ATT=1,ATT(1)=$$BLD^%VVIDEO1_$$UDL^%VVIDEO1_$$XY^%VVIDEO1(0,3)_"Action no "_(OP+1)_$$NORM^%VVIDEO1
 S %U="",DY=3,DX=1
 F %V=1:1 S %U=$O(^[QUI]MOZ("GRILLE",%UTIL,%TS,1,%U)) Q:%U=""  S ATS=$$GETLBLAN^%VTLBLAN($P(CLC,$C(1),%V)) I ATS'="" D OPS1
 F %U=1:1:ATT X XY W ATT(%U)
 K ATT Q
OPS1 ;; cao ATT<10 visu de la ligne d'en haut
 I ATT<10 S ATT=ATT+1 S:((ATT-2)#3)=0 DY=DY+1 S ATT(ATT)=$$XY^%VVIDEO1(DX+(((ATT-2)#3)*27),DY)_$E($$^%QZCHEV($P(^[QUI]MOZ("GRILLE",%UTIL,%TS,1,%U),"^",1),12,"D")_" = "_ATS,1,24)
 Q
PATOUCH(%U) 
 I $D(^[QUI]MOZ("GRILLE",%UTIL,%TS,%TY,%U)) S LIB=$P(^[QUI]MOZ("GRILLE",%UTIL,%TS,%TY,%U),"^",4),RESUL(%U+LIM)=LIB Q
 S RESUL(%U)="",PATOUCH(%U)=1 
 Q
PATOUCH2(%U,MOINS) 
 I $D(^[QUI]MOZ("GRILLE",%UTIL,%TS,%TY,%U-MOINS)) S LIB=$P(^[QUI]MOZ("GRILLE",%UTIL,%TS,%TY,%U-MOINS),"^",4),RESUL(%U)=LIB Q
 S RESUL(%U)="",PATOUCH(%U)=1 
 Q     
 
UCONT 
 N CTR,CPT,LST,ROUT,LG
 D INITUC^%MZCONF2(.LST)
 F CPT=1:1:LIM I $D(@GLO@(CPT)) S %U=CPT,CTR=$P(@GLO@(CPT),"^",5) D CTR(CPT,CTR)
 Q
 
CTR(I,C) 
 
 I C="" S ROUT="DATE^%MZEDOP" G CTR0
 I $E(C,1)?1A D CTR1 Q
 Q:'($D(LST(C,0)))
 S LG=$L(I,","),ROUT="",ROUT=ROUT_LST($P(C,",",1),0)
 I LG=1 S ^%SCRE(SCR,I,4)=ROUT Q
 F %U=2:1:LG S ROUT=ROUT_","_LST($P(C,",",%U),0)
CTR0 S ^%SCRE(SCR,I,4)=ROUT
 Q
CTR1 S ^%SCRE(SCR,I,4)=LST(8,0)_"("""_C_""")" Q
 
FUCONT F I=1:1:LIM+20 S ^%SCRE(SCR,I,4)="" ;;cao
 Q
FIND I $D(^[QUI]MOZ("GRILLE",WHOIS,$$GE^%MZQS,%TY)) S %TS=$$GE^%MZQS,%UTIL=WHOIS Q
 I $D(^[QUI]MOZ("GRILLE","TRAZOM",$$GE^%MZQS,%TY)) S %TS=$$GE^%MZQS,%UTIL="TRAZOM" Q
 S %TS="STAND",%UTIL="TRAZOM" Q
OPER 
 I RESUL(1)="" D ^%VZEAVT("Vous n'avez pas donner de valeur au numero d'operation : ce champ est obligatoire") G AFF
 
 S RESUL(1)=$$GETLBLAN^%VTLBLAN(RESUL(1))
 I '($$ENTP^%QZNBN(RESUL(1))) D ^%VZEAVT("Le numero d'operation doit etre entier et positif...") G AFF
 G SUIT
 
DATE 
 N BA,OBJ,IND,ATT,VAL,VALAFFI,LG,CH
 S LG=$L(RESUL(IC))
 S VAL=RESUL(IC)
 D CONT(IC,.BA,.ATT)
 
 
 I '($$FINT2^%QMDAUC(BA,ATT,.VAL)) D ^%VZEAVT($$^%QZCHW("La valeur de l'attribut doit etre de type date")) S REFUSE=1 Q
 S CH=$$AFFI^%QMDAUC(BA,ATT,VAL),ASTOCK(IC)=VAL
 S TAB(IC)=$J(" ",LG) D ^%VAFFICH
 S TAB(IC)=CH D ^%VAFFICH
 Q
 
CONT(IC,BA,ATT) 
 
 N P
 S ATT=$P(@GLO@(IC),"^",1)
 I ATT["!" D PROX
 E  S BA=$$OI^%MZQS
 Q
PROX 
 
 
 N LIEN
 D PEREFILS^%QSGEL2($$OI^%MZQS,.BA,.LIEN)
 S ATT=$P(ATT,"!",1)
 Q
 
 
mFIND(CLE) 
 N I,Cl1
 S Cl1=""
 S Glo="RESUL"
 F I=0:0 S Cl1=$O(@Glo@(Cl1)) Q:@Glo@(Cl1)=CLE
 
 Q Cl1

